# Zelda Notes Semi-Automated QR Scanner
This repo contains two scripts that can help you achieve the Extraordinary Designer medal in the Zelda Notes app without having to share your Autobuild QR codes with 10,000 people.

## Requirements
* Nintendo Switch 2
* An Android phone (I've only tested with a Samsung Galaxy S9+)
* A laptop / desktop device to run the bash scripts in this repo
* Python 3 installed on your device
* A USB cable to connect your Android phone to your computer.
* The Legend of Zelda: Tears of the Kingdom -- Nintendo Switch 2 Edition OR The Legend of Zelda: Tears of the Kingdom + Nintendo Switch 2 Edition Upgrade Pack
* 1 or 2 Nintendo Switch Online accounts
  * This depends on how you purchased ToTK. If you own the upgrade pack (either bought if from the eShop or purchased the Nintendo Switch 2 Edition of the game), you just need one NSO account, since any profile on your Switch 2 can use Zelda Notes. If you are "renting" the ToTK upgrade pack via the NSO expansion pack, you may need a second NSO account to use Zelda Notes on your alt profile.
* 2 Nintendo Switch 2 profiles
  * Your main profile must have Autobuild unlocked in ToTK.
  * The second profile only needs to start ToTK and turn Zelda Notes on in the settings. This profile is the one that will be scanning the QR codes.

## Definitions / Rules
* The medal's description states, "Earned by increasing your Designs Scanned Worldwide stat".
* The stat itself is defined as "The total number of times your designs have been scanned globally".

These two descriptions are somewhat misleading, as they don't mention which types of scans count toward the medal. Here's what I've learned from testing:

* You can scan your own QR codes (on the same account that created them), but they won't count toward your total scans.
* A friend (or alt account) can scan one of you QR codes N times, but you will only receive one point toward your medal.
* A friend (or alt account) can scan N of your QR codes 1 time each, and you will receive N points toward your medal.
* You can generate an unlimited number of QR codes from the same Autobuild.

Putting all of that information together, I found that you can use one Autobuild design to gain all 10,000 points needed for the platinum medal.

## Instructions
1. Download or clone this repo.
2. Install the Python libraries required to "scan" the QR codes: `pip3 install -r requirements.txt`
3. Make the scripts executable: `chmod +x qr_loop.sh && chmod +x scan_qr_codes.sh`
4. Enable ADB debugging on the Android phone, and connect it to the device running these scripts.
5. Open up ToTK in your main account (the one you want the medal on).
6. Select the Autobuild rune, and scroll to any custom design that can be shared.
7. Open the Zelda Notes app on your main account, and navigate to Autobuild Sharing.
8. Run `./qr_loop.sh`. This will loop infinitely, doing the following:

    a. Click on the top-leftmost QR code in the box.

    b. Grab a screenshot of your screen.

    c. Turn the QR code from the screenshot into a URL.

    d. Write the URL to a text file on your device.

    e. Navigate back to the QR code box (which will refresh the list as well).

9. While the loop is running, continuously press the X button on your Switch 2 controller. You should NOT spam this button, since Nintendo rate limits sending Autobuild designs to the app. I've found that while spamming the button, I can get a maximum of 17 designs sent to my phone before getting rate limited for around 1-2 minutes. The script is bottlenecked by the speed at which it can navigate the app and perform the steps above, so you only need to press X once per iteration.
10. When you're satisfied with the number of designs saved, stop the script (CTRL+C).
11. Log into your alt account on the Zelda Notes app, and navigate to Autobuild Sharing.
12. Run `./scan_qr_codes.sh`. This will iterate through every URL saved to `links.txt`, open the URL on the Android phone, and save the design to the app.

## Recommendations
1. Customize the timing variables in the script depending on the performance of the Android phone. My phone is pretty old, so I have to wait a few seconds between each step.
2. You never have to clear out the Autobuild box. New designs can still be added if the box is full, though they will kick out the old designs.
3. As stated above, do NOT spam X. Pressing once per iteration is just enough. If you press more than once, those other designs will be ignored, since the script only clicks on the top-left design (implementation choice made for simplicity's sake).

