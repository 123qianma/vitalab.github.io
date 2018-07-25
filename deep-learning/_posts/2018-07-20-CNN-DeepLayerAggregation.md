---
layout: review
title:  "Deep Layer Aggregation"
tags:   deep-learning CNN segmentation classification
author: "Pierre-Marc Jodoin"
pdf: "https://arxiv.org/pdf/1707.06484.pdf"
cite:
  authors: "Fisher Yu, Dequan Wang, Evan Shelhamer, Trevor Darrell"
  title:   "Deep Layer Aggregation"
  venue:   "CVPR 2018"
---

## Introduction

![](/deep-learning/images/deepAggregation/sc01.png)

Simple paper which revisit the well-known dense connections and feature aggregations typical of architectures like DenseNet and PyramidNet.

## Method

They proposed two new architectures : one for classification (fig.3) and one for segmentation (fig.4)
![](/deep-learning/images/deepAggregation/sc02.png)

![](/deep-learning/images/deepAggregation/sc03.png)

Note that the segmentation architecture is like a U-Net but with conv layers between the encoding and decoding layers.  The number of conv layers is inversely proportionnal to the dept of the layers. 


## Results

Without much surprise, the proposed architectures got quite good results on a variaty of classification datasets (like imagenet in Fig.5) and segmentation datasets (like Cityscapes in table 4).


![](/deep-learning/images/deepAggregation/sc04.png)

 
![](/deep-learning/images/deepAggregation/sc05.png)




