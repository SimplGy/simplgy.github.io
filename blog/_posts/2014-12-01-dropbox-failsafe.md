---
title: Archive Dropbox Every Night on OSX
color: rgb(0, 113, 224)
excerpt: A backup plan in case Dropbox goes haywire
---

I'm one of Dropbox's biggest fans. I've used them for years, referred them to friends and colleagues, collaborated on projects with it. Every text editor I consider must have seamless dropbox support. It's been a big part of my note taking and photo sharing strategy for a long time.

I thought (like everyone) -- Hey, I'll throw those documents into a Dropbox folder and they'll always be there. So important things go in and are saved (and safe) forever.

Once I had files disappear though, I realized what a big risk I was taking.

The reality, I discovered, is that in some ways Dropbox is LESS safe than storing on a single hard drive. Certainly it's more dangerous than a traditional cloud backup. This is because if there is a problem and files get removed, they are actively removed from all devices. No going back. (If you catch it quickly, I think there's a 30 day backup window, but do you actively monitor all your files? Prolly not.)

A system that propagates deletions is inherently dangerous. Those deletions could be accidental, caused by software error, or something else.

I needed protection.

## The Problem

I recently found some empty folders in my Dropbox that should not have been. I was relying on Dropbox for it's cloud storage and multi-device duplication--unfortunately it persisted the emptiness of these folders to all my devices and what was in them is lost permanently.

Dropbox takes no responsiblity for this. I think it happens when you rename or move a folder and the Dropbox server recieves the event showing the absent folder, but not the event adding the folder to the new location. I don't know, I'm guessing based on some notes I read from the Dropbox team on removable media.

## The Explanation

We're going to use some OSX tools to protect ourselves from data loss events.

If you want to make sure Dropbox never removes anything on you, you can build an archive of your Dropbox that is only additive. It'll have everything you ever added to it, so if something ever turns up missing, you can always go back to it.

It's very easy to set up on OSX, and probably on any system with the `zip` tool.

The key is that the default mode for `zip` is add mode, which only updates existing files and adds new ones. So if you run this every day--or even every hour, it will update the archive of the given name, adding new files and updating existing ones, but *not deleting files that are no longer present*. This is cool because it is what protects us from Dropbox's nasty Houdini behavior.

From `man zip`:

    add
    
    Update  existing entries and add new files.
    If the archive does not exist create it.  This is the default mode.

It might also be nice to have one per month or so. This way the pile of add-only files is managable, and we can delete old ones when we're comfortable doing so.

This is easily solved by mixing in the `date` command. (Thanks [Oli](http://askubuntu.com/questions/261079/how-can-i-create-zip-file-with-the-date-in-its-name)).

    zip "archive-$(date +"%Y-%m").zip" file1

To save space, you can exclude jpgs and pngs (I only view my documents as critical, my photos are backed up elsewhere):

    zip -r foo foo -x \*.jpg \*.png
    # The backslash avoids the shell filename substitution, so that the name matching is performed by zip at all directory levels.

## The Solution

We want all folders and files inside, so we use the `-r` recursive option, making our final command:

    zip -r --test "dropbox_$(date +"%Y-%m").zip" ~/Dropbox -x \*.jpg \*.png

So there you have it. Run a monthly zip archive of your dropbox folder and you'll be able to recover from catastrophic issues, should they ever happen.