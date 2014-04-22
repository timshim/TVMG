//
//  JWGCircleCounter.m
//  Version 0.1.1
//
//  https://github.com/johngraham262/JWGCircleCounter
//

#import "JWGCircleCounter.h"

#define JWG_SECONDS_ADJUSTMENT 1000
#define JWG_TIMER_INTERVAL .01 // 1/100 FPS

@interface JWGCircleCounter() {
    NSUInteger numAdjustedSecondsCompleted;
    NSUInteger numAdjustedSecondsCompletedIncrementor;
    NSUInteger numAdjustedSecondsTotal;
    NSUInteger numSeconds;
}
@end

@implementation JWGCircleCounter

#pragma mark - Public methods

- (void)baseInit {
    self.backgroundColor = [UIColor clearColor];

    self.circleColor = JWG_CIRCLE_COLOR_DEFAULT;
    self.circleBackgroundColor = JWG_CIRCLE_BACKGROUND_COLOR_DEFAULT;
    self.circleTimerWidth = JWG_CIRCLE_TIMER_WIDTH;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self baseInit];
    }

    return self;
}

- (void)startWithSeconds:(NSInteger)seconds {
    if (seconds < 1) {
        return;
    }

    if (self.didStart && !self.didFinish) {
        return;
    }

    numSeconds = seconds;
    numAdjustedSecondsCompleted = 0;
    numAdjustedSecondsCompletedIncrementor = seconds;
    numAdjustedSecondsTotal = seconds * JWG_SECONDS_ADJUSTMENT;

    _didStart = YES;
    _didFinish = NO;
    [self resume];
}

- (void)resume {
    if (!self.didStart || self.isRunning) {
        return;
    }

    _isRunning = YES;
    [self update];
}

- (void)stop {
    _isRunning = NO;
}

- (void)reset {
    [self stop];
    numAdjustedSecondsCompleted = 0;
    _didFinish = NO;
    _didStart = NO;
    [self setNeedsDisplay];
}

#pragma mark - Private methods

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    float radius = CGRectGetWidth(rect)/2.0f - self.circleTimerWidth/2.0f;
    float angleOffset = M_PI_2;

    // Draw the background of the circle.
    CGContextSetLineWidth(context, self.circleTimerWidth);
    CGContextBeginPath(context);
    CGContextAddArc(context,
                    CGRectGetMidX(rect), CGRectGetMidY(rect),
                    radius,
                    0,
                    2*M_PI,
                    0);
    CGContextSetStrokeColorWithColor(context, [[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:0.5] CGColor]);
    CGContextStrokePath(context);

    // Draw the remaining amount of timer circle.
    CGContextSetLineWidth(context, self.circleTimerWidth);
    CGContextBeginPath(context);
    CGFloat startAngle = (((CGFloat)numAdjustedSecondsCompleted + 1.0f) /
                          ((CGFloat)numAdjustedSecondsTotal)*M_PI*2 - angleOffset);
    CGFloat endAngle = 2*M_PI - angleOffset;
    CGContextAddArc(context,
                    CGRectGetMidX(rect), CGRectGetMidY(rect),
                    radius,
                    startAngle,
                    endAngle,
                    0);
    CGContextSetStrokeColorWithColor(context, [[UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:1] CGColor]);
    CGContextStrokePath(context);
}

- (void)update {
    if (self.isRunning) {
        numAdjustedSecondsCompleted += numAdjustedSecondsTotal / (numSeconds / JWG_TIMER_INTERVAL);
        if (numAdjustedSecondsCompleted >= numAdjustedSecondsTotal) {
            // finished
            numAdjustedSecondsCompleted = numAdjustedSecondsTotal - 1;
            [self stop];
            _didFinish = YES;

            // alert delegate method that it finished
            if ([self.delegate respondsToSelector:@selector(circleCounterTimeDidExpire:)]) {
                [self.delegate circleCounterTimeDidExpire:self];
            }
        } else {
            // in progress
            [NSTimer scheduledTimerWithTimeInterval:JWG_TIMER_INTERVAL
                                             target:self
                                           selector:@selector(update)
                                           userInfo:nil
                                            repeats:NO];
        }
        [self setNeedsDisplay];
    }
}

@end
