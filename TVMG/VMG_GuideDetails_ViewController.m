//
//  VMG_GuideDetails_ViewController.m
//  TVMG
//
//  Created by Tim Shim on 17/4/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import "VMG_GuideDetails_ViewController.h"
#import "VMG_Guides_ViewController.h"
#import "FTCoreTextView.h"

@interface VMG_GuideDetails_ViewController ()

@end

@implementation VMG_GuideDetails_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.contentTextView = [[UIView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height - 80)];
    
    self.contentScrollView = [[UIScrollView alloc] initWithFrame:self.contentTextView.bounds];
    
    self.coreTextView = [[FTCoreTextView alloc] initWithFrame:CGRectInset(self.contentScrollView.bounds, 20.0f, 0)];
    self.coreTextView.backgroundColor = [UIColor clearColor];
    
    [self.coreTextView addStyles:[self coreTextStyle]];
    
    [self.contentScrollView addSubview:self.coreTextView];
    [self.contentTextView addSubview:self.contentScrollView];
    [self.view addSubview:self.contentTextView];
    
    switch (self.index)
    {
        case 0:
            self.guideDetailsTitle.text = @"Tradition";
            self.coreTextView.text = @"<italic>Vipassana</italic>, which means to see things as they really are, is one of India's most ancient techniques of meditation. It was rediscovered by Goutama Buddha more than 2500 years ago and was taught by him as a universal remedy for universal ills; an <italic>Art Of Living</italic>. This non-sectarian technique aims for the total eradication of mental impurities and the resultant highest happiness of full liberation.\n\n"
            
            "Vipassana is a way of self-transformation through self-observation. It focuses on the deep interconnection between mind and body, which can be experienced directly by disciplined attention to the physical sensations that form the life of the body, and that continuously interconnect and condition the life of the mind. It is this observation-based, self-exploratory journey to the common root of mind and body that dissolves mental impurity, resulting in a balanced mind full of love and compassion.\n\n"
            
            "The scientific laws that operate one's thoughts, feelings, judgements and sensations become clear. Through direct experience, the nature of how one grows or regresses, how one produces suffering or frees oneself from suffering is understood. Life becomes characterized by increased awareness, non-delusion, self-control and peace.\n\n"
            
            "Since the time of Buddha, Vipassana has been handed down, to the present day, by an unbroken chain of teachers. Although Indian by descent, the current teacher in this chain, Mr. S.N. Goenka, was born and raised in Burma (Myanmar). While living there he had the good fortune to learn Vipassana from his teacher, Sayagyi U Ba Khin who was at the time a high Government official. After receiving training from his teacher for fourteen years, Mr. Goenka settled in India and began teaching Vipassana in 1969. Since then he has taught tens of thousands of people of all races and all religions in both the East and West. In 1982 he began to appoint assistant teachers to help him meet the growing demand for Vipassana courses.\n\n\n";
            break;
            
        case 1:
            self.guideDetailsTitle.text = @"Technique";
            self.coreTextView.text = @"1.  <_bullet>Sit cross-legged or on a chair or other position comfortable for you. Make sure to keep your spine straight to allow energy flow and the right posture.</_bullet>\n\n"
            
            "2.  <_bullet>Start from the top of your head – also known as ‘the crown’ area and observe any sensations for a few seconds (5 seconds or 3 breaths). You can imagine your mind as a neutral scanner that simply records all the sensations in the given area and has no internal verbal comments – thus having equanimity.</_bullet>\n\n"
            
            "3.  <_bullet>Continue to scan the face and back of the head for a few seconds (5 seconds or 3 breaths).</_bullet>\n\n"
            
            "4.  <_bullet>Continue to scan the neck area.</_bullet>\n\n"
            
            "5.  <_bullet>Continue to scan the right shoulder, forearm and hand and back in reverse order.</_bullet>\n\n"
            
            "6.  <_bullet>Continue to scan the left shoulder, forearm and hand and back in reverse order.</_bullet>\n\n"
            
            "7.  <_bullet>Continue to scan the front torso and the back torso.</_bullet>\n\n"
            
            "8.  <_bullet>Continue to scan the pelvic area.</_bullet>\n\n"
            
            "9.  <_bullet>Continue to scan the right thigh, leg and foot and back in reverse.</_bullet>\n\n"
            
            "10. <_bullet>Continue to scan the left thigh, leg and foot and back in reverse.</_bullet>\n\n"
            
            "11. <_bullet>Continue to scan upwards by scanning the pelvic area (front and back).</_bullet>\n\n"
            
            "12. <_bullet>Continue to scan the front and back torso.</_bullet>\n\n"
            
            "13. <_bullet>Continue to scan from the right hand, forearm and shoulder.</_bullet>\n\n"
            
            "14. <_bullet>Continue to scan from the left hand, forearm and shoulder.</_bullet>\n\n"
            
            "15. <_bullet>Continue to scan the neck area (front and back).</_bullet>\n\n"
            
            "16. <_bullet>Continue to scan the face area and back of the head.</_bullet>\n\n"
            
            "17. <_bullet>Finish the scan at the top of the head (crown area)</_bullet>.\n\n"
            
            "You now have finished the full body scanning from top to bottom and back. Continue scanning several times from top to bottom and back to top (depending on your speed, you might complete 8 times per hour or so).\n\n"
            
            "<italic>Notes:</italic>  During the above scanning of your body sensations area by area, make sure to keep in mind the following points:\n\n"
            
            "1.  <_bullet>You are a neutral observer and do not make one sensation more important or less important. They are simply sensations, you might itch, notice subtle sensations, pain or numbness, perspiration, etc. You are simply noticing all the sensations.</_bullet>\n\n"
            
            "2.  <_bullet>Thoughts would also be popping up during the meditation, simply note it as a thought and continue bringing your attention to the scanned area. Make sure not to get into describing, evaluating or trying to get rid of thoughts or have aversion towards painful or unpleasant sensations.</_bullet>\n\n"
            
            "3.  <_bullet>You might feel no gross sensations in certain areas, make sure to pause a few seconds and move onto another area. Do not be discouraged that you are not getting uniform sensations or any sensations at all. At all times there are sensations and might be subtle and you might be not ready to notice it yet or there might be just right amount of sensations.</_bullet>\n\n"
            
            "4.  <_bullet>You will realize that all the sensations rise and pass away (impermanence – anicca). Some of the sensations, i.e. numbness in the leg might be longer during one round of scanning, but eventually will pass away.</_bullet>\n\n"
            
            "5.  <_bullet>If you experience a pain or strong numbness and need to change position, you can do so by doing it mindfully and noting every moment of moving the position. As you do more meditation, try to simply observe the sense of numbness.</_bullet>\n\n"
            
            "6.  <_bullet>Do not jump from the current area being scanned to another area since the gross sensations in the other area might be stronger.\nRemember - YOU are the master of your mind and not the other way around. Just simply tell yourself “I will get to those gross sensations, when I get to that area”. You will be surprised that by time you get there, the sensations might pass away and you might forget all about it.</_bullet>\n\n"
            
            "7.  <_bullet>If you are not able to do Vipassana and are overwhelmed by sensations, just simply take 10 deep conscious breaths to calm your mind and continue doing Vipassana.</_bullet>\n\n"
            
            "8.  <_bullet>The most important thing is to continue doing Vipassana diligently and not to be discouraged by temporary setbacks. At the end, little by little you will achieve equanimity and serenity.</_bullet>\n\n\n"
            
            "<subtitle>Advanced Vipassana Meditation</subtitle>\n\nIf you have done 40 hours of Vipassana meditation and you are able to have equanimity and have diligently observed all the sensations in the area in the correct order, you are ready to start Advanced Vipassana Meditation.\n\n"
            
            "In this stage, you will continue to do the same steps for scanning. You would have the following focus:\n\n"
            
            "1.  <_bullet>Scan the whole area, i.e. the front torso, as one area and observe subtle and uniform sensations. Continue doing it for several meditations or until you feel that you are able to do it easily and not get distracted.</_bullet>\n\n"
            
            "2.  <_bullet>Scan the whole front area of the body as ONE area (head to toes as one big sweep) and second scan the whole back area as ONE area. Continue doing it until you feel at ease with one sweep.</_bullet>\n\n"
            
            "3.  <_bullet>More advanced: Focus on one area in the whole body (laser focus on a small part of the body) and bring your attention there. Choose the area and bring your attention there. Continue doing it until you feel it is easy to do.</_bullet>\n\n"
            
            "4.  <_bullet>Bring your attention and feel as if the subtle energy goes through your whole body (it can be either horizontal or vertical) as if there are no barriers – like the wind goes through you and no sense of muscle or organs or bones. As you achieve this level, you will feel that ‘self’ becomes no self (anatta) since nothing there and your Ego dissolves as a result. At this stage you might feel a quantum feeling of being in one place and somewhere else in the universe. All your sense of 'I', 'Me', 'Mine', a male/female, profession, status, suddenly dissolves and you are ‘one’ with the universe. Beware of your mind. At this stage, your mind can be happy and congratulate you on such an achievement and your mind will try get attached to such a feeling and try to hold on, thus suffering (dukkha). Simply go back and start meditation again and choose not to be attached to this accomplishment. Everything changes and you make sure to keep your focus on Vipassana meditation.</_bullet>\n\n"
            
            "I hope that Vipassana meditation is helpful to cultivate your mind and purify your mind towards enlightenment.\n\n\n";
            break;
            
        case 2:
            self.guideDetailsTitle.text = @"Code of Discipline";
            self.coreTextView.text = @"The foundation of the practice is síla, moral conduct. Síla provides a basis for the development of samádhi, concentration of mind; and purification of the mind is achieved through pañña, the wisdom of insight.\n\n"
            
            "<subtitle>The Precepts</subtitle>\n\n"
            
            "All who attend a Vipassana course must conscientiously undertake the following five precepts for the duration of the course:\n\n"
            
            "<italic>To abstain from killing any being.\n"
            "To abstain from stealing.\nTo abstain from all sexual activity.\n"
            "To abstain from telling lies.\n"
            "To abstain from all intoxicants.</italic>\n\n"
            
            "There are three additional precepts which old students (that is, those who have completed a course with S.N. Goenka or one of his assistant teachers) are expected to follow during the course:\n\n"
            
            "<italic>To abstain from eating after midday.\n"
            "To abstain from sensual entertainment and bodily decorations.\n"
            "To abstain from using high or luxurious beds.</italic>\n\n"
            
            "Old students will observe the sixth precept by having tea without milk or fruit juice at the 5 pm break, whereas new student may have tea with milk and some fruit. The teacher may excuse an old student from observing this precept for health reasons. The seventh and eighth precept will be observed by all.\n\n"
            
            "<subtitle>Acceptance of the Teacher and the Technique</subtitle>\n\n"
            
            "Students must declare themselves willing to comply fully and for the duration of the course with the teacher's guidance and instructions; that is, to observe the discipline and to meditate exactly as the teacher asks, without ignoring any part of the instructions, nor adding anything to them. This acceptance should be one of discrimination and understanding, not blind submission. Only with an attitude of trust can a student work diligently and thoroughly. Such confidence in the teacher and the technique is essential for success in meditation.\n\n"
            
            "<subtitle>Other Techniques, Rites, and Forms of Worship</subtitle>\n\n"
            
            "During the course it is absolutely essential that all forms of prayer, worship, or religious ceremony — fasting, burning incense, counting beads, reciting mantras, singing and dancing, etc. — be discontinued. All other meditation techniques and healing or spiritual practices should also be suspended. This is not to condemn any other technique or practice, but to give a fair trial to the technique of Vipassana in its purity. Students are strongly advised that deliberately mixing other techniques of meditation with Vipassana will impede and even reverse their progress. Despite repeated warnings by the teacher, there have been cases in the past where students have intentionally mixed this technique with a ritual or another practice, and have done themselves a great disservice. Any doubts or confusion which may arise should always be clarified by meeting with the teacher.\n\n"
            
            "<subtitle>Interviews with the Teacher</subtitle>\n\n"
            
            "The teacher is available to meet students privately between 12 noon and 1:00 pm. Questions may also be asked in public between 9:00 and 9:30 pm in the meditation hall. The interview and question times are for clarifying the technique and for questions arising from the evening discourses.\n\n"
            
            "<subtitle>Noble Silence</subtitle>\n\n"
            
            "All students must observe Noble Silence from the beginning of the course until the morning of the last full day. Noble Silence means silence of body, speech, and mind. Any form of communication with fellow students, whether by gestures, sign language, written notes, etc., is prohibited. Students may, however, speak with the teacher whenever necessary and they may approach the management with any problems related to food, accommodation, health, etc. But even these contacts should be kept to a minimum. Students should cultivate the feeling that they are working in isolation.\n\n"
            
            "<subtitle>Separation of Men and Women</subtitle>\n\n"
            
            "Complete segregation of men and women is to be maintained. Couples, married or otherwise, should not contact each other in any way during the course. The same applies to friends, members of the same family, etc.\n\n"
            
            "<subtitle>Physical Contact</subtitle>\n\n"
            
            "It is important that throughout the course there be no physical contact whatsoever between persons of the same or opposite sex.\n\n"
            
            "<subtitle>Yoga and Physical Exercise</subtitle>\n\n"
            
            "Although physical yoga and other exercises are compatible with Vipassana, they should be suspended during the course because proper secluded facilities are not available at the course site. Jogging is also not permitted. Students may exercise during rest periods by walking in the designated areas.\n\n"
            
            "<subtitle>Religious Objects, Rosaries, Crystals, Talismans, etc.</subtitle>\n\n"
            
            "No such items should be brought to the course site. If brought inadvertently they should be deposited with the management for the duration of the course.\n\n"
            
            "<subtitle>Intoxicants and Drugs</subtitle>\n\n"
            
            "No drugs, alcohol, or other intoxicants should be brought to the site; this also applies to tranquilizers, sleeping pills, and all other sedatives. Those taking medicines or drugs on a doctor's prescription should notify the teacher.\n\n"
            
            "<subtitle>Tobacco</subtitle>\n\n"
            
            "For the health and comfort of all students, smoking, chewing tobacco, and taking snuff are not permitted during the course.\n\n"
            
            "<subtitle>Food</subtitle>\n\n"
            
            "It is not possible to satisfy the special food preferences and requirements of all the meditators. Students are therefore kindly requested to make do with the simple vegetarian meals provided. The course management endeavors to prepare a balanced, wholesome menu suitable for meditation. If any students have been prescribed a special diet because of ill-health, they should inform the management at the time of application. Fasting is not permitted.\n\n"
            
            "<subtitle>Clothing</subtitle>\n\n"
            
            "Dress should be simple, modest, and comfortable. Tight, transparent, revealing, or otherwise striking clothing (such as shorts, short skirts, tights and leggings, sleeveless or skimpy tops) should not be worn. Sunbathing and partial nudity are not permitted. This is important in order to minimize distraction to others.\n\n"
            
            "<subtitle>Laundry and Bathing</subtitle>\n\n"
            
            "No washing machines or dryers are available, so students should bring sufficient clothing. Small items can be hand-washed. Bathing and laundry may be done only in the break periods and not during meditation hours.\n\n"
            
            "<subtitle>Outside Contact</subtitle>\n\n"
            
            "Students must remain within the course boundaries throughout the course. They may leave only with the specific consent of the teacher. No outside communications is allowed before the course ends. This includes letters, phone calls and visitors. Cell phones, pagers, and other electronic devices must be deposited with the management until the course ends. In case of an emergency, a friend or relative may contact the management.\n\n"
            
            "<subtitle>Music, Reading and Writing</subtitle>\n\n"
            
            "The playing of musical instruments, radios, etc. is not permitted. No reading or writing materials should be brought to the course. Students should not distract themselves by taking notes. The restriction on reading and writing is to emphasize the strictly practical nature of this meditation.\n\n"
            
            "<subtitle>Recording Devices and Cameras</subtitle>\n\n"
            
            "These may not be used except with the express permission of the teacher.\n\n\n";
            break;
            
        case 3:
            self.guideDetailsTitle.text = @"SN Goenka";
            self.coreTextView.text = @"<_image>goenkaPhoto.png</_image>\nAlthough Indian by descent, Mr. Goenka was born and raised in Myanmar (Burma). While living there, he had the good fortune to come into contact with Sayagyi U Ba Khin and to learn the technique of Vipassana from him.\n\n"
            
            "After receiving training from his teacher for 14 years, Mr. Goenka settled in India and began teaching Vipassana in 1969. In a country still sharply divided by differences of caste and religion, the courses offered by Mr. Goenka soon attracted thousands of people from every part of society. In addition, many people from countries around the world came to join courses in Vipassana meditation.\n\n"
            
            "Over a period of almost 45 years, Mr. Goenka and the teachers appointed by him taught hundreds of thousands of people in courses in India and other countries, East and West. Today, meditation centers established under his guidance are operating in Asia, Europe, the Americas, Africa and Australasia.\n\n"
            
            "The technique taught by S.N. Goenka goes back two and a half millennia to the Buddha. The Buddha never taught a sectarian religion; he taught Dhamma – the way to liberation – which is universal. In the same tradition, Mr. Goenka's approach is totally non-sectarian. For this reason, his teaching has had a profound appeal to people of all backgrounds, of every religion and no religion, and from every part of the world.\n\n"
            
            "Mr. Goenka was the recipient of many awards and honors in his lifetime, including the prestigious Padma Award from the President of India in 2012. This is the highest civilian honor given by the Indian Government.\n\n"
            
            "Satya Narayan Goenka breathed his last on September 2013, at the age of 89. He has left beyond an imperishable legacy: the technique of Vipassana, now available more widely than ever before to people around the world.\n\n\n";
            break;
            
        case 4:
            self.guideDetailsTitle.text = @"Locations";
            self.coreTextView.text = @"Where are Vipassana courses held?";
            break;
            
        case 5:
            self.guideDetailsTitle.text = @"Course Timetable";
            self.coreTextView.text = @"The following timetable for the course has been designed to maintain the continuity of practice. For best results students are advised to <italic>follow it as closely as possible.</italic>\n\n"
            
            "<subtitle>4:00 am</subtitle>\nMorning wake-up bell\n\n"
            
            "<subtitle>4:30 – 6:30 am</subtitle>\nMeditate in the hall or in your room\n\n"
            
            "<subtitle>6:30 – 8:00 am</subtitle>\nBreakfast break\n\n"
            
            "<subtitle>8:00 – 9:00 am</subtitle>\nGroup meditation in the hall\n\n"
            
            "<subtitle>9:00 – 11:00 am</subtitle>\nMeditate in the hall or in your room\n\n"
            
            "<subtitle>11:00 – 12:00 pm</subtitle>\nLunch break\n\n"
            
            "<subtitle>12:00 –1:00 pm</subtitle>\nRest and interviews with the teacher\n\n"
            
            "<subtitle>1:00 – 2:30 pm</subtitle>\nMeditate in the hall or in your room\n\n"
            
            "<subtitle>2:30 – 3:30 pm</subtitle>\nGroup meditation in the hall\n\n"
            
            "<subtitle>3:30 – 5:00 pm</subtitle>\nMeditate in the hall or in your own room\n\n"
            
            "<subtitle>5:00 – 6:00 pm</subtitle>\nTea break\n\n"
            
            "<subtitle>6:00 – 7:00 pm</subtitle>\nGroup meditation in the hall\n\n"
            
            "<subtitle>7:00 – 8:15 pm</subtitle>\nTeacher's Discourse in the hall\n\n"
            
            "<subtitle>8:15 – 9:00 pm</subtitle>\nGroup meditation in the hall\n\n"
            
            "<subtitle>9:00 – 9:30 pm</subtitle>\nQuestion time in the hall\n\n"
            
            "<subtitle>9:30 pm</subtitle>\nLights out\n\n\n";
            break;
            
        case 6:
            self.guideDetailsTitle.text = @"Discourse";
            self.coreTextView.text = @"Daily evening discourse videos.";
            break;
            
        case 7:
            self.guideDetailsTitle.text = @"Questions";
            self.coreTextView.text = @"<subtitle>Why is the course ten days long?</subtitle>\n\n"
            
            "Actually, the ten-day course is the minimum; it provides an essential introduction and foundation to the technique. To develop in the practice is a lifetime job. Experience over generations has shown that if Vipassana is taught in periods of less than ten days, the student does not get a sufficient experiential grasp of the technique. Traditionally, Vipassana was taught in retreats lasting seven weeks. With the dawning of the 20th century, the teachers of this tradition began to experiment with shorter times to suit the quickening pace of life. They tried thirty days, two weeks, ten days, down to seven days--and they found that less than ten days is not enough time for the mind to settle down and work deeply with the mind-body phenomenon.\n\n"
            
            "<subtitle>How many hours a day will I be meditating?</subtitle>\n\n"
            
            "The day begins at 4:00 a.m. with a wakeup bell and continues until 9:00 p.m. There are about ten hours of meditation throughout the day, interspersed with regular breaks and rest periods. Every evening at 7:00 p.m. there is a videotaped lecture by the Teacher, S.N. Goenka, which provides a context for meditators to understand their experience of the day. This schedule has proved workable and beneficial for hundreds of thousands of people for decades.\n\n"
            
            "<subtitle>What language is used in the course?</subtitle>\n\n"
            
            "The teaching is given through recordings of S.N. Goenka, speaking in English or Hindi, together with a translation into a local language. Tape translations exist in most of the major languages of the world, including English. If the teachers conducting a course do not speak the local language fluently, interpreters will be there to help. Language is usually no barrier for someone who wants to join a course.\n\n"
            
            "<subtitle>How much does the course cost?</subtitle>\n\n"
            
            "Each student who attends a Vipassana course is given this gift by a previous student. There is no charge for either the teaching, or for room and board. All Vipassana courses worldwide are run on a strictly voluntary donation basis. At the end of your course, if you have benefited from the experience, you are welcome to donate for the coming course, according to your volition and your means.\n\n"
            
            "<subtitle>How much are teachers paid to conduct courses?</subtitle>\n\n"
            
            "Teachers receive no payment, donations or other material benefit. They are required to have their own private means of support. This rule means that some of them may have less time for teaching, but it protects students from exploitation and it guards against commercialism. In this tradition, teachers give Vipassana purely as a service to others. All they get is the satisfaction of seeing people's happiness at the end of ten days.\n\n"
            
            "<subtitle>I can't sit cross legged. Can I meditate?</subtitle>\n\n"
            
            "Certainly. Chairs are provided for those unable to sit comfortably on the floor because of age or a physical problem.\n\n"
            
            "<subtitle>I'm on a special diet. Can I bring my own food?</subtitle>\n\n"
            
            "If your doctor has prescribed a special diet, let us know and we will see whether we can provide what you need. If the diet is too specialized or would interfere with meditation, we might have to ask you to wait until you can be more flexible. We're sorry but students are required to choose from the food provided to them, rather than bring food for themselves. Most people find the choice is ample and they enjoy the simple vegetarian diet.\n\n"
            
            "<subtitle>Can pregnant women attend courses? Are there any special arrangements or instructions for them?</subtitle>\n\n"
            
            "Pregnant women may certainly attend, and many women come specifically during pregnancy to take advantage of the opportunity to work deeply and in silence during this special time. We ask pregnant women to ensure they are confident that their pregnancy is stable before applying. We provide the extra food they need and ask them to work in a relaxed way.\n\n"
            
            "<subtitle>Why is a course conducted in silence?</subtitle>\n\n"
            
            "All students attending the course observe 'noble silence' — that is, silence of body, speech and mind. They agree to refrain from communicating with their co-meditators. However, students are free to contact the management about their material needs, and to speak with the instructor. Silence is observed for the first nine full days. On the tenth day, speech is resumed as a way of re-establishing the normal pattern of daily life. Continuity of practice is the secret of success in this course; silence is an essential component in maintaining this continuity.\n\n"
            
            "<subtitle>How can I be sure I am capable of doing the meditation?</subtitle>\n\n"
            
            "For a person in reasonable physical and mental health who is genuinely interested and willing to make a sincere effort, meditation (including 'noble silence') is not difficult. If you are able to follow the instructions patiently and diligently, you can be sure of tangible results. Though it may appear daunting, the day's schedule is neither too severe nor too relaxed. Moreover, the presence of other students practicing conscientiously in a peaceful and conducive atmosphere lends tremendous support to one's efforts.\n\n"
            
            "<subtitle>Is there anyone who should not participate in a course?</subtitle>\n\n"
            
            "Obviously someone who is physically too weak to follow the schedule will not be able to benefit from a course. The same is true of someone suffering from psychiatric problems, or someone undergoing emotional upheaval. Through a process of questions and answers, we will be able to help you decide clearly beforehand whether you are in a position to benefit fully from a course. In some cases applicants are asked to get approval from their doctor before they can be accepted.\n\n"
            
            "<subtitle>Can Vipassana cure physical or mental diseases?</subtitle>\n\n"
            
            "Many diseases are caused by our inner agitation. If the agitation is removed, the disease may be alleviated or disappear. But learning Vipassana with the aim of curing a disease is a mistake that never works. People who try to do this waste their time because they are focusing on the wrong goal. They may even harm themselves. They will neither understand the meditation properly nor succeed in getting rid of the disease.\n\n"
            
            "<subtitle>How about depression? Does Vipassana cure that?</subtitle>\n\n"
            
            "Again, the purpose of Vipassana is not to cure diseases. Someone who really practices Vipassana learns to be happy and balanced in all circumstances. But a person with a history of severe depression may not be able to apply the technique properly and may not get the desired results. The best thing for such a person is to work with a health professional. Vipassana teachers are meditation experts, not psychotherapists.\n\n"
            
            "<subtitle>Can Vipassana make people mentally unbalanced?</subtitle>\n\n"
            
            "No. Vipassana teaches you to be aware and equanimous, that is, balanced, despite all the ups and downs of life. But if someone comes to a course concealing serious emotional problems, that person may be unable to understand the technique or to apply it properly to achieve the desired results. This is why it is important to let us know your past history so that we can judge whether you will benefit from a course.\n\n"
            
            "<subtitle>Do I have to be a Buddhist to practice Vipassana?</subtitle>\n\n"
            
            "People from many religions and no religion have found the meditation course helpful and beneficial. Vipassana is an art of living, a way of life. While it is the essence of what the Buddha taught, it is not a religion; rather, it is the cultivation of human values leading to a life which is good for oneself and good for others.\n\n"
            
            "<subtitle>Why do I have to stay for the entire ten days?</subtitle>\n\n"
            
            "Vipassana is taught step by step, with a new step added each day to the end of the course. If you leave early, you do not learn the full teaching and do not give the technique a chance to work for you. Also, by meditating intensively, a course participant initiates a process that reaches fulfillment with the completion of the course. Interrupting the process before completion is not advisable.\n\n"
            
            "<subtitle>Is it dangerous to leave a course early?</subtitle>\n\n"
            
            "The point is that leaving early is shortchanging yourself. You don't give yourself a chance to learn the full technique and so you won't be able to apply it successfully in daily life. You also interrupt the process in the middle rather than letting it come to the proper conclusion. To get home a day or two early, you waste all the time you have invested.\n\n"
            
            "<subtitle>How about the tenth day, when talking is allowed and serious meditation stops? Can I leave then?</subtitle>\n\n"
            
            "The tenth day is a very important transition back to ordinary life. No one is permitted to leave on that day.\n\n\n";
            break;
    }
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //  We need to recalculate fit height on every layout because
    //  when the device orientation changes, the FTCoreText's width changes
    
    //  Make the FTCoreTextView to automatically adjust it's height
    //  so it fits all its rendered text using the actual width
	[self.coreTextView fitToSuggestedHeight];
    
    //  Adjust the scroll view's content size so it can scroll all
    //  the FTCoreTextView's content
    [self.contentScrollView setContentSize:CGSizeMake(CGRectGetWidth(self.contentScrollView.bounds), CGRectGetMaxY(self.coreTextView.frame)+20.0f)];
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark FTCoreText Styling

- (NSArray *)coreTextStyle
{
    NSMutableArray *result = [NSMutableArray array];
    
    //  This will be default style of the text not closed in any tag
	FTCoreTextStyle *defaultStyle = [FTCoreTextStyle new];
	defaultStyle.name = FTCoreTextTagDefault;	//thought the default name is already set to FTCoreTextTagDefault
	defaultStyle.font = [UIFont fontWithName:@"GillSans-Light" size:20.0f];
	defaultStyle.textAlignment = FTCoreTextAlignementLeft;
    defaultStyle.color = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.8f];
    defaultStyle.minLineHeight = 30.0;
    defaultStyle.maxLineHeight = 30.0;
	[result addObject:defaultStyle];
	
    //  Create style using convenience method
	FTCoreTextStyle *titleStyle = [FTCoreTextStyle styleWithName:@"title"];
	titleStyle.font = [UIFont fontWithName:@"GillSans-Light" size:30.f];
	titleStyle.textAlignment = FTCoreTextAlignementLeft;
	[result addObject:titleStyle];
	
    //  Image will be centered
	FTCoreTextStyle *imageStyle = [FTCoreTextStyle new];
	imageStyle.name = FTCoreTextTagImage;
    imageStyle.paragraphInset = UIEdgeInsetsMake(0, 5.0f, 0, 0);
	[result addObject:imageStyle];
	
	FTCoreTextStyle *firstLetterStyle = [FTCoreTextStyle new];
	firstLetterStyle.name = @"firstLetter";
	firstLetterStyle.font = [UIFont fontWithName:@"GillSans-Light" size:20.f];
	[result addObject:firstLetterStyle];
	
    //  This is the link style
    //  Notice that you can make copy of FTCoreTextStyle
    //  and just change any required properties
	FTCoreTextStyle *linkStyle = [defaultStyle copy];
	linkStyle.name = FTCoreTextTagLink;
	linkStyle.color = [UIColor whiteColor];
    linkStyle.underlined = YES;
	[result addObject:linkStyle];
	
	FTCoreTextStyle *subtitleStyle = [FTCoreTextStyle styleWithName:@"subtitle"];
	subtitleStyle.font = [UIFont fontWithName:@"GillSans-Light" size:25.0f];
	subtitleStyle.color = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.8f];
	[result addObject:subtitleStyle];
	
    //  This will be list of items
    //  You can specify custom style for a bullet
	FTCoreTextStyle *bulletStyle = [defaultStyle copy];
	bulletStyle.name = FTCoreTextTagBullet;
	bulletStyle.bulletFont = [UIFont fontWithName:@"GillSans-Light" size:20.0f];
	bulletStyle.bulletColor = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.8f];
	bulletStyle.bulletCharacter = @"";
	bulletStyle.paragraphInset = UIEdgeInsetsMake(0, 30.0f, 0, 0);
	[result addObject:bulletStyle];
    
    FTCoreTextStyle *italicStyle = [defaultStyle copy];
	italicStyle.name = @"italic";
    italicStyle.font = [UIFont fontWithName:@"GillSans-LightItalic" size:20.0f];
	[result addObject:italicStyle];
    
    FTCoreTextStyle *underlineStyle = [defaultStyle copy];
	underlineStyle.name = @"underline";
    underlineStyle.font = [UIFont fontWithName:@"GillSans-Light" size:20.0f];
    underlineStyle.underlined = YES;
	[result addObject:underlineStyle];
    
    FTCoreTextStyle *boldStyle = [defaultStyle copy];
	boldStyle.name = @"bold";
    boldStyle.font = [UIFont fontWithName:@"GillSans" size:20.0f];
	[result addObject:boldStyle];
    
    FTCoreTextStyle *coloredStyle = [defaultStyle copy];
    [coloredStyle setName:@"colored"];
    [coloredStyle setColor:[UIColor redColor]];
	[result addObject:coloredStyle];
    
    return  result;
}

@end
