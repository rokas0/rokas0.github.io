---
id: 1995
title: Playing with AWS Lambda, Scala and Terraform
date: 2018-01-07T09:09:25+00:00
author: Rokas
layout: post
guid: http://rokaso.com/?p=1995
permalink: /2018/01/playing-with-aws-lambda-scala-and-terraform/
image: 2017/12/Fitbit-and-Google-calendar-sync.jpg
categories:
  - AWS
  - Infrastructure as code
  - NodeJS
  - Scala
  - Tech
---

I have been tracking my activity levels on a physical calendar, which involves extra work to write down your workouts. But also, I always track them on my Fitbit as an activity, mainly because of this enabled stopwatch and shows your current heart rate, also at the finish your average and max heart rate.

I am already tracking many things on Calendar as explained in <a href="http://rokaso.com/2017/12/osvaldas-year-2017-in-photos-and-resolutions/" target="_blank" rel="noopener">Osvaldas year 2017 in photos and resolutions</a>. So why not to add one more feature, which eventually would improve my exercising levels? Also, coding is FUN! So roll your sleeves up and let&#8217;s get dirty.

During implementation, I have improved my knowledge of

- Node.js
- Scala 2.12 and sbt
- AWS Lambda
- AWS DynamoDB
- AWS Gateway API

First, let&#8217;s choose your programing language. AWS Lambda at the moment allows C#, Python 2.7 and 3.6, Node.js 4.3 and 6.10 and Java 8. Also, any other JVM language as you will see further on [or here](https://aws.amazon.com/blogs/compute/writing-aws-lambda-functions-in-scala/). I have initially chosen Node.js as my team is using it extensively, but later on, we moved on to Scala, therefore my other Lambda function uses Scala. AWS Lambda allows pain-free function hosting. It simplifies operations and lets a developer just code without minding about underlying infrastructure and scaling.

AWS fits perfectly our problem to host single function to output calendar.

The underlying architecture is pretty simple. A user views Google Calendars, which updates by calling our developed AWS Lambdas. First, the get Fitbit access token calling another lambda function, which retrieves it from DynamoDB and proceeds. If an error occurred with message *expired_token* when another lambda function is triggered to refresh it and also store in the database. It is described below

{% include imgs.html src='2017/12/Fitbit-and-Google-calendar-sync.jpg' %}

AWS Lambda pricing might [get tricky](https://aws.amazon.com/lambda/pricing/) but if you executing only several times a day, it&#8217;s basically free. You get plenty of free execution. For example, if you average execution would take whole 3 seconds twice a day for a month, it would be 30 (3s = 30 \* 100ms) \* 0.000000208 (price per 100ms of execution) \* 30 (avg. days in a month) \* 2 (twice a day) =  $0.0003744 which is still $0. Initially, I wanted to store the function on my EC2 server, but if Lambda function is basically free anyways, let&#8217;s do it there!

Worth mentioning that Lambda function should return JSON (in a defined format). Otherwise, you might get unexpected results. If you want to hook it up to API Gateway, you could do variable mapping (or, if Node.js returns properly formatted JSON, would I need variable mapping?)

For storing data, I have used NoSQL DynamoDB as it was another learning

<span class="st">&#8220;</span>_<span class="st">does not allow you to adjust the update interval for iCal calendar subscriptions and does not observe a TTL set in the calendar feed</span>&#8220; [[MIT, 2016]](http://kb.mit.edu/confluence/display/istcontrib/How+to+change+the+update+frequency+of+a+calendar+I+am+subscribing+to). _However, you can force it by adding any random string at the end of the URL. For example, \_https://rokaso.execute-api.eu-north-1.amazonaws.com/dev/fitbit_ becomes _https://rokaso.execute-api.eu-north-1.amazonaws.com/dev/fitbit**?randomABC**_

&nbsp;

**Code as infrastructure**

Common approach working on bigger projects is to use *code as infrastructure*, where you define operational settings in a programming language. I have used _Terraform _to deploy an infrastructure to AWS. Considering my zero knowledge using the tool, I found it much easier to use fancy AWS graphical user interface. Learning curve is high for external infrastructure tools

However, there are many reasons to use the code as infrastructure. First, it simplifies deployment. Imagine an average size company employing 100 software engineers divided into 15 teams. Now chose just one team and let&#8217;s call it A-team, which is responsible just for a single microservice. A-team has 6 developers and 2 testers. Each developer has to have own environment with reasonably up-to-date infrastructure. If this team member changes anything, it has to be reflected too, because if not, another developer would be working on different settings which would cause problems further own the pipeline. Therefore it&#8217;s very useful to keep environments in sync.

Moreover, the current speed of deployment is accelerating fast! A decade ago decent software company would release product updates every half a year. Later on with a software migrating more into an internet, reasonable deployment to live could be once a month. This was not enough. As argued in a novel [The Phoenix Project](https://www.amazon.co.uk/Phoenix-Project-DevOps-Helping-Business/dp/B00VBEBRK6) developers should also do infrastructure. I remember in my previous company how much release team was suffering once a month when it was deployment to live time. For us developers it was an easy job, we just push a code, double check if everything is alright, refer to testers to double check and that&#8217;s it. Everything is all butterflies. But suddenly when release comes to live, the code starts to break, by this time developers are off, but release engineers suffering. Many reasons might be for breaking code, for example

- Most common &#8211; version mismatches, which includes all tools and libraries
- Cache was not cleared
- Correct permissions were not given for external/internal URLs/files
- Newer version breaking old code
- Database entries mismatch
- Config mismatch
- and the list continues to infinity

These resulted in sleepless nights for release engineers and even failed deployments. Also, problems would stack up causing very slow deployments pipeline. In the book, [The Phoenix Project](https://www.amazon.co.uk/Phoenix-Project-DevOps-Helping-Business/dp/B00VBEBRK6) author compares technology department to a factory, that everything has to work in flow and a company is as strong as its weakest link. So if the software wasn&#8217;t delivered due to the final stage (i.e. release) then it&#8217;s everyone&#8217;s problem and whole company has to find a solution. Therefore methodologies like *infrastructure as a code* and *DevOps culture* is used in my current company. In short, it makes a developer responsible for deploying to live. Overall, *infrastructure as a code* is a worthwhile practice.

Getting back to original topic. If using AWS and planning to work on an actual project, playing with Terraform is worthwhile, but otherwise, you AWS graphical console as it&#8217;s amazingly simple to use. For this small project, I have used just AWS graphical console. Also, I have been wondering, why AWS just not let you export your infrastructure? Or so-called reverse engineering? Well, you can actually do it using https://github.com/dtan4/terraforming

&nbsp;

Overall, coding your own solutions using new technologies is breathtaking. You learn many paradigms, which might be applicable to your actual job. Also, hundreds of thousands of software engineers are solving similar problems including ease of development, deployment and scalability, they are also releasing solutions as an open source (or not) projects. So just take a look what&#8217;s out there and it might make your proffesional life much easier.
