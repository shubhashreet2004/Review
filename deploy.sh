#!/bin/bash
    echo hi123
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u shubhashree1311 -p 
    docker tag test shubhashree1311/review
    docker push shubhashree1311/review
    docker-compose up -d
