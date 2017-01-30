---
layout:    post
title:     Welcome to the Literature Review site of VITAL
date:      2017-01-27 12:18:56 -0500
permalink: /welcome-how-to/
---

## Goal of this website

The goal of this website is to collaborate by helping each other stay up to date with new advances. It will also help people that are new to the field to acquire essential knowledge about the state of the art.

## How to add a review

The process for adding reviews is _git-centric_. Basically, **you just need to add a file to the repo and make a pull request**. Let's go into the details :

1. Clone [the `vitalab.github.io` repo](https://github.com/vitalab/vitalab.github.io) on your computer.
2. Create the file `YYYY-MM-DD-title-of-your-review.markdown` in the folder `/_posts`. `name-of-your-review` can be the title of the paper, for example. **The format is important, the name of the file must begin by the date of creation of your review.**
3.  Copy this template in your new file :  
    ``` markdown
    ---
    layout: review
    title:  Title of your Review
    tags:   convolutional-networks deep-learning  # put relevant tags here
    ---
    
    Content of your review.
    ```
    You can [preview your post while you write it](#previewing-your-post-locally) ; see the next section about this.
4.  **Make a new branch**, commit your file and push.
5.  [**Create a pull request**](https://github.com/vitalab/vitalab.github.io/compare) on the repo's github page.
6.  **Add reviewers**: everybody that you think are knowledgeable about the subject or simply would be interested in your review.
7.  When everybody is satisfied, **merge your branch and delete it**.

## Previewing your post locally

This site is built around [**Jekyll**](https://jekyllrb.com/). Jekyll takes all the markdown files and generates a static html website.

1.  [Install Ruby using rbenv](/how-to-install-ruby).
2.  Install Jekyll by running : `gem install bundler jekyll`.
3.  Go where you cloned the repo and run : `bundle install`. This will install the dependencies for our Jekyll site.
4.  Run a local webserver using : `bundle exec jekyll serve`.

Note that the site is automatically rebuilt when you make changes to a file.