matchismo
=========

iOS Swift App.  Was assigned as homework for my IS 543 Swift iOS development class.  A card matching game, plus more!  

Requirements for Part 1
=========

Required Tasks
1. Follow the detailed instructions in the lecture slides (separate documents) to reproduce the latest version of Matchismo we built in lecture (i.e. the one with multiple cards) and run it in the iPhone Simulator (iPhone 5 size). Do not proceed to the next steps unless your card matching game functions as expected and builds without warnings or errors.
2. Add 4 more cards to the game (for a total of 16).
3. Add a text label somewhere that describes the results of the last flip. Examples:
“Matched J♥ & J♠ for 4 points” or “6♦ and J♣ don’t match: 2 point penalty” and
simply “Flipped up 8♦” if there is no match or mismatch.
4. Add a button called “Deal” that will re-deal all of the cards (i.e. start a new game). It
should reset the score (and anything else in the UI that makes sense). In a real game, we’d probably want to ask the user if s/he is “sure” before aborting the current game in order to re-deal, but for this assignment, you can assume that the user always knows what s/he is doing when hitting this button.
5. Drag out a switch (UISwitch) or a segmented control (UISegmentedControl) into your View somewhere to control whether the game matches two cards at a time or three cards at a time (i.e. it sets “2-card-match mode” vs. “3-card-match mode”). Give the user appropriate points depending on how difficult the match is to accomplish. (You get to pick the specific scoring formula.)
6. Disable the game play mode control (i.e. the UISwitch or UISegmentedControl from Required Task #5) when flipping starts and re-enable it when a re-deal happens (i.e. the Deal button is pressed).
7. Use the images I’ve posted on Learning Suite to make the back of the card be an image (UIImage) rather than an Apple  logo and to make the front of the card look like a real card with white background, black border, and rounded corners.

Requirements for Part 2
==========
1. Add a tab bar controller to your application. One tab will be the game you built last week in Project 1. The other tab will be a new game, Set. Set is still a card game, so a good solution to this assignment will use object-oriented programming techniques to share a lot of code.
2. Don’t violate any of the Required Tasks from Project 1 in the playing card game tab (in other words, don’t break any features from last week). The only exception is that your playing card game is only required to be a 2-card-match game this week, so if you’d like you can now remove the switch or segmented control you added in Project 1. Your Set game is a 3-card matching game.
3. The Set game only needs to allow users to pick sets and get points for doing so (it does not re-deal new cards when sets are found). In other words, it works just like your other card game (except that it is a 3-card match with different kinds of cards).
4. Choose reasonable amounts to award the user for successfully finding a set or for incorrectly picking cards that are not a set.
5. Your Set game should have 24 cards.
6. Instead of drawing the cards in the classic form (we’ll do that next week), we’ll use
these three characters ▲ ● ■ and use attributes in NSAttributedString to draw them
appropriately (i.e. colors and shading).
7. Your Set game should have a Deal button, Score label and Flips label just like your
playing-card matching game from Project 1.
8. Your Set game should also report matches and mismatches like you did in Project 1,
but you’ll have to enhance this feature (to use NSAttributedString) to make it work for displaying Set card matches.