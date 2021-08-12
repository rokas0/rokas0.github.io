---
id: 1862
title: Why and how to migrate your photos from Flickr to Google Photos using AWS?
date: 2017-12-02T07:04:50+00:00
author: Rokas
layout: post
guid: http://rokaso.com/?p=1862
permalink: /2017/12/why-and-how-to-migrate-your-photos-from-flickr-to-google-photos-using-aws/
image: 2017/11/23668881_10215461573638296_5354618564819991642_o.jpg
categories:
  - AWS
  - Tech
---

I have recently migrated all my photos (300 GB of them) from Flickr to Google. Why?

Quick table of comparison

<table>
  <tr>
    <td>
    </td>
    
    <td>
      <strong>Flickr</strong>
    </td>
    
    <td>
      <strong>Google Photos</strong>
    </td>
  </tr>
  
  <tr>
    <td>
      <strong>Free space</strong>
    </td>
    
    <td style="background: #66ff66;">
       1 TB
    </td>
    
    <td style="background: #ff3333;">
      Unlimited space if images are up to 16 mpixels
    </td>
  </tr>
  
  <tr>
    <td>
      <strong>Interface</strong>
    </td>
    
    <td style="background: #66ff66;">
      Okay
    </td>
    
    <td style="background: #66ff66;">
      Good
    </td>
  </tr>
  
  <tr>
    <td>
      <strong>Auto-uploader (Mobile)</strong>
    </td>
    
    <td style="background: #66ff66;">
      Yes
    </td>
    
    <td style="background: #66ff66;">
      Yes
    </td>
  </tr>
  
  <tr>
    <td>
      <strong>Auto-uploader (Windows/Mac)</strong>
    </td>
    
    <td style="background: #ff3333;">
      <ul>
        <li>
          No. Only buggy manual for free
        </li>
        <li>
          Yes, for 5.99$ a month
        </li>
      </ul>
    </td>
    
    <td style="background: #66ff66;">
      Yes!
    </td>
  </tr>
  
  <tr>
    <td>
      <strong>Artificial intelligence assistant</strong>
    </td>
    
    <td style="background: #ff3333;">
      No
    </td>
    
    <td style="background: #66ff66;">
      Yes!
    </td>
  </tr>
</table>

These final two points made a decision to move back to Google Photos. First of all, Flickr auto-uploader is crap, especially in third world countries with lagging internet. One can&#8217;t upload photos overnight because it might be stuck and terminate uploads. Also, Googles artificial intelligence assistant is great, more on that later.

I was looking for an automated solution to transfer my life memories but faced two issues.

**Issue #1**

I couldn&#8217;t find any automated solution to transfer the images, mainly because Google Photos API does not allow storage based on the unlimited quota if using API.

At a time of writing, I got one more idea. If you use Flickr API to download the photos and save into a folder, which later will be linked to Google auto-uploader. I tried using third party Flickr downloaders for this purpose, but the issue was incorrect metadata, which links &#8220;created&#8221; and &#8220;last modified&#8221; timestamps to now, which would mess up my photo history later on.

**My issue #2**

There is a reason, why I call this section &#8220;my issue&#8221; because my internet is shit. Well, don&#8217;t get me wrong, my internet is alright if I am browsing the internet, streaming movies, uploading stuff. But then you need to download and upload 300GB, my internet connection is shit. It starts to download photos from Flickr, but pings out and terminates. I tried to use different software for the job but still failed miserably.

**Solution**

I ended up using a desktop in Amazon Web Services (AWS) cloud called Amazon WorkSpaces. As part of AWS trail, you can run it for free for limited time, but sufficient for transferring pictures. It took minutes to spin up a desktop and connect to it. Needless to say, the speed was amazing, and I could easily download the photos from Flickr, unzip them and upload to Google using auto-uploader. I connected to the desktop using AWS provided software for both Windows and Android.

**A final note on Google intelligent assistant**

<div id="js_6z" class="_5pbx userContent _3576" data-ft="{&quot;tn&quot;:&quot;K&quot;}">
  <div id="id_5a19220c5e44e7162859785" class="text_exposed_root text_exposed">
    <p>
      Google artificial intelligence and machine algorithms are advancing fast! My main reason to move Google photos, mainly because of an interface and assistant, which frequently offers picture enhancements. The other day, I got auto-generated collage, and I was shocked how good it was, mainly because:
 (1) Both pictures were perfectly cropped into a frame
 (2) It was completely 2 random pictures. One taken last week on the top of the highest peak in Irelan<span class="text_exposed_show">d Carrauntoohil (1,038m), while another half a year ago in Ecuador on a random peak (Iliniza Norte) raising 5116m above sea level. In Google Photos I&#8217;ve 10 000+ moments stored, and it picked up both on the top of a peak. An algorithm should be pretty darn good to find similar moments.</span>
    </p>
    
    <div class="text_exposed_show">
    </div>
  </div>
</div>

<div class="_3x-2">
  <div data-ft="{&quot;tn&quot;:&quot;H&quot;}">
    <div class="mtm">
      <div class="_2a2q">
        <figure id="attachment_1863" aria-describedby="caption-attachment-1863" style="width: 533px" class="wp-caption alignnone">{% include imgs.html src='2017/11/23668881_10215461573638296_5354618564819991642_o-533x400.jpg' %}
<figcaption id="caption-attachment-1863" class="wp-caption-text">Google auto-generated picture &#8220;Then & Now&#8221;</figcaption></figure> 
        
        <p>
          &nbsp;
        </p><figure id="attachment_1864" aria-describedby="caption-attachment-1864" style="width: 600px" class="wp-caption alignnone">
        
        {% include imgs.html src='2017/11/23592071_10215461574358314_5575744746523548304_o-600x397.jpg' %}
<figcaption id="caption-attachment-1864" class="wp-caption-text">Original picture 2017 April in Ecuador</figcaption></figure> <figure id="attachment_1865" aria-describedby="caption-attachment-1865" style="width: 600px" class="wp-caption alignnone">{% include imgs.html src='2017/11/23550385_10215461574318313_2343067906176958303_o-600x397.jpg' %}
<figcaption id="caption-attachment-1865" class="wp-caption-text">Original picture in Ireland 2017 November</figcaption></figure>
      </div>
      
      <div>
        <div id="js_6z" class="_5pbx userContent _3576" data-ft="{&quot;tn&quot;:&quot;K&quot;}">
          <div id="id_5a19220c5e44e7162859785" class="text_exposed_root text_exposed">
            <div class="text_exposed_show">
              <p>
                What a time to be alive! Can&#8217;t wait to see further development in computer science algorithms
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
