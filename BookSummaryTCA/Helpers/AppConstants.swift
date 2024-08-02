//
//  AppConstants.swift
//  BookSummaryTCA
//
//  Created by Taras Tarasenko on 01.08.2024.
//

import Foundation

struct AppConstants {
    
    static let standartPadding = 10.0
    static let imageSize = 24.0
    static let toggleSize: CGFloat = 50.0
    static let animationDuration = 0.5
    static let secondsForward = 10.0
    static let secondsbackward = 5.0
    
    
    static let summaryInfo = SummaryModel(
        chapterDetails: [
            ChapterDetails(chapterNumber: 1, keyPoint: "Every action you take is a vote for the person you want to become.", time: 0.0),
            ChapterDetails(chapterNumber: 2, keyPoint: "Success is the product of daily habits — not once-in-a-lifetime transformations.", time: 140.0),
            ChapterDetails(chapterNumber: 3, keyPoint: "Habits are the compound interest of self-improvement.", time: 260.0),
            ChapterDetails(chapterNumber: 4, keyPoint: "The quality of your life depends on the quality of your habits.", time: 380.0),
            ChapterDetails(chapterNumber: 5, keyPoint: "Small habits, when repeated consistently, lead to remarkable results.", time: 500.0),
            ChapterDetails(chapterNumber: 6, keyPoint: "Make it easy to do right and hard to go wrong.", time: 620.0),
            ChapterDetails(chapterNumber: 7, keyPoint: "You do not rise to the level of your goals, you fall to the level of your systems.", time: 740.0),
            ChapterDetails(chapterNumber: 8, keyPoint: "Habits are the invisible architecture of everyday life.", time: 860.0),
            ChapterDetails(chapterNumber: 9, keyPoint: "It’s not about what you want to achieve, it’s about who you want to become.", time: 900.0),
            ChapterDetails(chapterNumber: 10, keyPoint: "Habits are the bridge between goals and accomplishments.", time: 1000.0)
        ], fileName: "summary_audio",
        fileType: "m4a",
        image: "book_image",
        fullText: """
    It is so easy to overestimate the importance of one defining moment and underestimate the value of making small improvements on a daily basis.

    Meanwhile, improving by 1 percent isn’t particularly notable— sometimes it isn’t even noticeable—but it can be far more meaningful, especially in the long run. The difference a tiny improvement can make over time is astounding. Here’s  how  the math works out: if you can  get 1 percent better each day for one year, you’ll end up thirty-seven times better by the time you’re done. Conversely, if you get 1 percent worse each day for one year, you’ll decline nearly down to zero. What starts as a small win or a minor setback accumulates into something much more.

    It doesn’t matter how successful or unsuccessful you are right now. What matters is whether your habits are putting you on the path toward success.

    Focus on getting 1 percent better every day.

    Lesson 2: Forget about setting goals. Focus on your system instead.

    Goals are about the results you want to achieve. Systems are about the processes that lead to those results.

    If you’re having trouble changing your habits, the problem isn’t you. The problem is your system. Bad habits repeat themselves again and again not because you don’t want to change, but because you have the wrong system for change.

    You do not rise to the level of your goals. You fall to the level of your systems.

    Atomic Habits presents a proven system for building good habits and breaking bad ones.

     Lesson 3: Build identity-based habits

     The key to building lasting habits is focusing on creating a new identity first. Your current behaviors are simply a reflection of your current identity. What you do now is a mirror image of the type of person you believe that you are (either consciously or subconsciously). To change your behavior for good, you need to start believing new things about yourself. You need to build identity-based habits. Changing your beliefs isn’t nearly as hard as you might think. There are two steps.

    Decide the type of person you want to be. Prove it to yourself with small wins.Your identity emerges out of your habits. Every action is a vote for the type of person you wish to become. How to build better habits in 4 simple stepsThis section of the Atomic Habits summary presents key points from the actionable strategies in the book, organized around a framework called the Four Laws of Behavior Change.The process of building a habit can be divided into four simple steps: cue, craving, response, and reward. Breaking it down into these fundamental parts can help us understand what a habit is, how it works, and how to improve it.
""")
}
