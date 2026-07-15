# I'm a CEO Now: AI Agents Run My Entire Dev Workflow

- **Channel:** DevOps & AI Toolkit (Viktor Farcic)
- **Published:** 2026-07-06
- **Duration:** 15:08
- **URL:** https://www.youtube.com/watch?v=DxZHsMu3NU0

> Auto-generated transcript from YouTube captions (cleaned: timestamps and duplicate cue lines removed, reflowed to prose). `[__]` marks a censored word in the original captions.

---

Oh, I'm a [__] CEO now. I'm not that type of CEO. Let me tell you how my day looks like. For real.
It's very different from my days a year or even a month ago. My day among other things results in
code being written and tested, features shipped, issues resolved, problems in my Kubernetes cluster
sorted out, AWS quirks dealt with, and so on and so forth. It's a typical day for a developer,
except there is nothing typical about how it's done. The outcomes are the same as they always were,
but how I get to those outcomes, well, that's a completely different now. It starts where many days
actually end. The whole premise here is running not just one AI agent, but a whole fleet of them,
all working in parallel. And that quietly assumes something, that you're already comfortable putting
AI to work in the first place. If you're not quite there yet, if AI still feels like a chatbot you
ask the occasional question, that's where the sponsor of this video comes in. Outskill runs a
two-day AI Mastermind, a weekend workshop that takes you from poking at the chatbot to actually
building with AI. Over 16 hours with expert mentors, you go hands-on with 10+ AI tools, deep
research, building your own agents, automating the boring parts of your week, generating images and
video, and getting into cloud code itself. The training normally costs $895, but the sponsor is
giving away 1,000 free seats to viewers of this channel, and over 10 million people have already
been through it. You can grab a free seat through the link in the description, scan the QR code on
screen, and join the WhatsApp community before the seats run out. So, big thanks to Outschool for
sponsoring this video. Now, let's get back to building our agent server. The first thing I do is
connect to the machine where my agents have been or are still running. What you're looking at are
all the features my agents were grinding, grinding while I was asleep. Each tab across the top is a
separate work tree, one per feature or issue they picked up overnight. By morning, they've each been
taken as far as the agents can take them on their own, which means every one of them is now either
done or waiting on input from me. My job is simple to describe. Go through them and work out who's
genuinely finished and ready to merge, and what still needs a decision or a nudge. It's simple to
describe, but it's exhausting to actually do. Fully reviewing what someone or something else did is
tough enough for a single new feature. Five at once or more is madness. Yet, here we are. Here's one
the agents consider done. It run the feature through every single gate. The fast unit tests and the
full end-to-end suite both pass, and the reviewer and the auditor flagged nothing serious. It even
suggests my next move, to merge it and file a quick follow-up for the one deferred item. But, and
this is important, notice that I don't take it up on that, at least not yet. Done, so far as the
agents are concerned, is not the same as merged. Before anything lands, I want to put my own hands
on it, and that comes later in the day. For now, I just take note and keep going. Their
recommendation to merge, by the way, isn't the opinion of a single agent. It's the end result of a
whole team. Whole team working on that one feature. A coder wrote it, a reviewer checked it, an
auditor scrutinized it, a tester exercised it, and each one is specialized in its own kind of work.
Now, I will not get into why splitting the work up like that matters here, since I already went deep
on it in a separate video, and you can check it out. It's in the description, most likely. For
today, just keep in mind that every single feature has a small crew behind it. Not not a single
agent. Not a lonely, lonely agent. And now, the other kind. This feature came back with a red
end-to-end gate. Instead of ignoring it or blindly forcing the change through, the agent
investigated, worked out what the failing test is. Uh it is a pre-existing flake that has nothing to
do with its own changes, right? And then, then it stopped to ask me, "Hey, how do you want to handle
it?" It even lays out the options from shipping it as is to digging deeper, right? Now, I tell it to
harden the flaky test first, because, hey, why do I want a flaky test? Doesn't matter whether it's
part of this release or not. That's the whole point of those gates. The agent does the legwork and
the reasoning, but the judgment call stays with me. And there's GitHub, right? And what's happening
over on GitHub is honestly a completely normal developer workflow. Nothing exotic about it. The
agents open pull requests, one per feature, and that's exactly the way a human team would operate.
And those pull requests get reviewed as well. The first pass is done by AI. In this case, it's
Kripto summarizing what changed and why, and it's flagging anything that looks off. I can, of
course, review on top of that, and so can anyone else on the team. But, most of the time, I don't
need to because by the time I look, my agents have already digested those reviews and fixed whatever
Reptile flagged. And in the end, every push triggers GitHub Actions, right? As as it should. This
This is the same continuous integration pipelines any project should or hopefully does run. It
builds, tests, cleans, and does all the things that you normally do. Now, once in a while, one of
those runs goes red. And when that happens, the agents pick it up and correct it themselves. So, a
lateral run comes back green without me lifting a finger. Now, to be honest, I rarely visit GitHub
at all. Not for a while. Over time, I've built up a set of instructions that nudge and push the
agents, not to say force them, toward doing the right things on their own. So, by the time I sit
down to review, my default assumption is that everything is either green or sitting there waiting
for my input. So, where does that leave the morning, huh? Some features are done, though not yet
merged, and they're waiting for final verification from me. Others are back in progress now that I
handed the agents the extra instructions they were missing. Now, make no mistake about the shape of
this, though. The bulk of the work was already done while I was asleep. What's left for me are
nudges, right? And those nudges are mostly details. The small judgment calls that push each feature
the last few steps to done done. So, with that morning review behind me, I move on to the far more
boring part of the day. I mean, it's a horrible part of the day. I'm answering emails, I'm sitting
through meetings, I'm taking actual breaks to eat, and whatever else needs to be done the
old-fashioned way. The agents keep working in in the whole time, and I will come back to run through
this review a few more times between meetings, right? If I have some time, I will see what's going
on. So, by now the agents are done with their part. Everything that could be finished is finished.
So, it's my turn to put hands on the new features and bug fixes and test them myself. The easiest
way to start is to simply ask, "Hey, what should I be looking at?" And there we go. It hands me a
checklist of what to try and what correct behavior should look like. Now, this isn't me handing over
my judgment, though. I've wrote the specs, so I already know what needs testing. The checklist is
more of a second opinion, a sanity check against my own in case it caught something I would skip
over. Now, there is one detail worth calling out before I go further. Everything you've seen so far,
the whole deck and every agent in it has been running on a remote machine. It's a little small mini
PC sitting in my office. To actually run the test, I switch over to my own work computer and open up
a fresh terminal tab. From there on, it's a handful of ordinary commands. I move into the project,
drop into a shell, check out the pull request for the feature I want to look at, and build and run
the app locally. Now, here's a quick note so that this doesn't get confusing. I test whatever needs
testing, whichever app it happens to be, and in this case it happens to be the same app I used to
orchestrate all those agents in the first place. And it's all happening mostly while I sleep. Now,
while the app is running, I work through the checklist, opening up the parts that were supposed to
change and watching how they actually behave. Boring stuff. Let's skip through it. Now, once I'm
satisfied that this one genuinely works, I head back to the deck and give the order I've been
holding back most of the day. Merge it and delete the work tree behind it. So, that's the first
feature truly done. From there on, I just repeat the loop. Test the next one, correct it if
something is off, merge it, and move on to the next one after that. Feature by feature, fix by fix,
until I reach the very last merge of the batch. Now, with the last feature merged, some of the
projects are now ready for an actual version release. This is even a different project entirely,
which is rather the point. The same workflow stretches across everything I work on. The agent
collects the changelog fragments that piled up over all those merges, proposes the next version
number, and tags it, which is what kicks off the release pipeline. And the instruction that set all
of that all of that in motion was about as involved as it sounds. Make a release. Now, we're in the
strangest part of all this. My day ends exactly where the whole process begins. The last thing I do
before stepping away isn't wrapping things up. It's kicking off the next round of work. So, I open
the deck back up, this time not to review work, but to start it. The first move is to pull the full
list of things I might want to tackle next. And there we go. There's the list of everything I might
pick up next organized so I can see my options at a glance. So, what will I do? I will choose a
couple of to start on and ask for a separate work tree to be set up for each and every one of them.
And the result is that I got set up an isolated work tree for each one, every feature in its own
branch and its own directory kept cleanly apart so the agents never trip over each other. Now, for
each of those work trees, I start up an orchestrator. It's a manager that will take charge of that
feature and coordinate its team. So, each one boots up, loads the instructions that define its role,
and settles in to wait for directions. So, I hand each manager the same starting command, the one
that runs the full workflow for its feature from planning all the way through implementation,
testing, review, audit, continuous integration, and everything in between. So, they get to work and
pretty soon one of them comes back. Right, I'm not done yet. It comes back with a question. And most
of the time this is the only thing it ever asks me. It asks me to confirm the test plan before it
starts building against it. So, it's one decision from me and then it's off on its own. So, from
there the manager starts delegating to its team. Here it's handling the first step off to the
tester. He can go off a test-driven cycle where the tests get written before the code that has to
satisfy them. Now, once every manager is rolling, I just detach. Not because anything depends on it.
The agents would keep working just fine whether I'm attached or not. The point is that I don't have
to watch. It's time for bed, not supervision. The whole reason this works for me is that I'm not
standing over those agents micromanaging every move. I set them going and then I leave them to it.
Now, let's step back from all of it, right? And the whole day stops looking like coding and starts
looking like running a small, fast company. I sit at the top. I'm like a CEO. Right? I don't write
any of the code myself. I read the reports that come up to me and decide whether to approve the work
or send it back to be course corrected. Now, below me are managers, each one owning a single
feature, nothing more. And each manager is a team of specialized engineers. One writes the code,
another reuse it, another tests it, another ships the release. It's a one-to-many structure all the
way down. One of me, many features moving at once, and the whole crew working each of those features
in parallel. Now, the tool I use to run this happens to be Agendadock. It's a project I started, but
the point was never the tool, right? You could build something similar with other setups. What
matters is the shape. An entire org working for you around the clock. So, that's the day, right? I
congratulate myself on yet another genuinely productive day. I wind down with a game, maybe some
YouTube or or a beer. I go to sleep, and while I'm out, while I'm sleeping, the company keeps
working, so that tomorrow I can wake up and start the whole cycle over again. Now, one more thing
before you go. The tool running all of this, Agendadock, is open source. So, check out the project
if you like where it's heading, give it a star if you want to tinker, fork it, and try to sell. And
if you got ideas, open an issue or send a pull request. It's open source, so make it yours. It's for
you. I mean, it's made for me, but now anybody can use it. Thank you for watching. See you in the
next one. Cheers.
