matchismo
=========

iOS Swift Program.  Was assigned as homework for my IS 543 Swift iOS development class.

The following were the requirements of the assignment

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

Need More of a Challenge?
Here is an idea for something you could do to get some more experience with the SDK at this point in the game.
Add a UISlider to your UI that travels through the history of the current game’s flips and display it to the user (moving the slider will modify the contents of the text label you created for Required Task #3 to show its state over the course of the game). When you are displaying past flips, you probably want the text label to be grayed out (with alpha) or something so it’s clear that it’s “the past.” Also, you probably don’t want that text label from Required Task #3 to ever be blank (except at the very start of the game, of course). And every time a new flip happens, you probably want to “jump to the present” in the slider. Implementing this extra item will require you to familiarize yourself with UISlider’s API and to add a data structure to your Controller to keep track of the history. It can be implemented in fewer than a dozen lines of code.
