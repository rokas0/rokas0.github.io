---
id: 2189
title: AWS certified. My journey and exam tips
date: 2018-04-06T19:26:06+00:00
author: Rokas
layout: post
guid: http://rokaso.com/?p=2189
permalink: /2018/04/aws-developer-associate-certified-my-journey-and-exam-tips/
image: https://d1ra7kav7kguzj.cloudfront.net/2018/04/Screen-Shot-2018-04-06-at-19.24.54.png
categories:
  - AWS
  - Tech
tags:
  - aws
  - certified
  - exam
  - learning
  - studying
---
> &#8220;To learn, to learn and to learn&#8221; &#8211; Vladimir Lenin

Learning new stuff is fun as long as you apply correct principles.

To study for AWS Certification I&#8217;ve applied same principles as for spoken language studies. There 3 pillars

**1. Have S.M.A.R.T goal**

S.M.A.R.T goal is:

> Specific – target a specific area for improvement.  
> Measurable – quantify or at least suggest an indicator of progress.  
> Assignable – specify who will do it.  
> Realistic – state the results that can be achieved realistically, given available resources.  
> Time-related – specify when the result(s) can be achieved.

For me, it was &#8220;get AWS certification in three months&#8221;. I find it difficult to study for an extended period in my personal time without a specific goal. Getting a certification might be one of the goals, other could be building something, following course exercises or contributing to open-source projects

**2. Repetition**

> ”Repetitio est mater studiorum” (engl. “Repetition is the mother of learning”)

Another cheesy phrase use-it-or-lose-it applies to memory too. Professor and creator of probably the best language learning system even defined periods for repetitions which should be done in following intervals: 5 seconds, 25 seconds, 2 minutes, 10 minutes, 1 hour, 5 hours, 1 day, 5 days, 25 days, 4 months, and 2 years (Pimsleur, 1967).

Repetition also means that you need to make time for studying daily.

**3. Proper notes**

Note taking should stimulate your thinking. For example, a note &#8220;_S3 bucket name allows lowercase letters, digits, dots and dashes_&#8220;don&#8217;t involve your recall capabilities. Rather you&#8217;d use a flashcard with a question &#8220;_What are S3 allowed characters?_&#8221; with an answer on another side &#8220;_lowercase letters, digits, dots and dashes_&#8220;. Latter example would take slightly longer to produce and review but as a side effect you&#8217;d remember much better. I got used to this habit even while listening to talks I constantly ask myself &#8220;Was it new and useful to me?&#8221; if the answer is yes, then add this as a note form. I found this so useful, I even developed my small app to add notes and sync them.

**My steps to get certified**

Watched videos of [AWS course](https://www.udemy.com/aws-certified-developer-associate/) while taking notes as flashcard type. Meanwhile, signed up for an exam. Later did practise quizzes and added more notes. I was studying my flashcards daily to recall subject I learned recently. In order to have even more fun, I developed my our apps on AWS. Finally went to the exam and passed.

**Exam tips**

For preparation, I used acloudguru [course](https://www.udemy.com/aws-certified-developer-associate/) and [practise exam](https://www.udemy.com/aws-certified-developer-associate-2017-practice-tests/). They&#8217;re good but not perfect. Below are points I missed from courses/practises:

  * CloudFormation is an important topic to score you easy points. Just review few templates and research what each field is used for
  * The exam doesn&#8217;t require you to memorize numbers by heart. As long as you roughly know the number it&#8217;s fine. For example, exam question was to calculate _DynamoDB Provisioned Throughput_ for given requirements. Given answers were something like this 2, 20, 200 or 2000 which varies a lot! So you&#8217;d need only to roughly have an idea about formulas and numbers.
  * More focus on DynamoD, indexes and sort keys
  * I got tricky question whatever a user can change the role of EC2. AWS recently changed to allow this but I wasn&#8217;t sure whatever they updated the questions.
  * I miserably failed on IAM questions which I&#8217;d definitely need to review. One of them being proper identification with web identity federation
  * Roughly remember common API calls for developer exam for example ReceiveMessageWaitTimeSeconds is to enable long-pooling
  * I got few questions regarding S3 optimisation but I knew nothing about it. Read this blog post more about it https://aws.amazon.com/blogs/aws/amazon-s3-performance-tips-tricks-seattle-hiring-event/. In summary, add a random md5 <span style="text-decoration: underline;">prefix</span> to a name of an item to store items in different partitions
  * Read up a bit about ElastiCache
  * Note that ProvisionedThroughputExceededException is not just for a table but also for global indexes

This is it, good luck with your studies!

**Reference**

Pimsleur, Paul (February 1967). &#8220;A Memory Schedule&#8221;. The Modern Language Journal. Blackwell Publishing. 51 (2): 73–75
