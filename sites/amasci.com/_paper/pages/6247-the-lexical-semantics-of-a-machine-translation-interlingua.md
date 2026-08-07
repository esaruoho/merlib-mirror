---
title: "The Lexical Semantics of a Machine Translation Interlingua"
source_domain: amasci.com
source_path: ~ram/lexical_semantics.html
order: 6247
reachable_from_entry: false
images: 0
internal_links: 0
extracted: 2026-08-07T05:59:04Z
extractor: site_to_paper.py (pandoc)
---

# The Lexical Semantics of a Machine Translation Interlingua

*Source page: `~ram/lexical_semantics.html`*

\

# The Lexical Semantics of a Machine Translation Interlingua

[by Rick Morneau](http://www.eskimo.com/~ram)

[ram@eskimo.com](mailto:%20ram@eskimo.com)

First Internet draft date: July 30, 1995

Current draft date: April 24, 2003

Copyright 2003 by Richard A. Morneau,

all rights reserved.

<span id="toc"></span>

------------------------------------------------------------------------

## Table of Contents

- [Preface](#preface)
- [1.0 Introduction](#S1_0)
- [2.0 Verbs](#S2_0)
  - [2.1 Verb Classification - State Verbs](#S2_1)
  - [2.2 Verb Classification - Dynamism and Telicity](#S2_2)
  - [2.3 Verb Classification - Action Verbs](#S2_3)
  - [2.4 Generalizations About Verbs](#S2_4)
  - [2.5 Verb Design Algorithm](#S2_5)
    - [2.5.1 The Morphotactics and Pronunciation of the Interlingua](#S2_5_1)
    - [2.5.2 Verb Design Examples](#S2_5_2)
    - [2.5.3 From Basic Verb to Noun](#S2_5_3)
    - [2.5.4 From Basic Verb to Adjective](#S2_5_4)
    - [2.5.5 From Basic Verb to Adverb and Case Tag](#S2_5_5)
      - [2.5.5.1 From Basic Verb to Verbal Modifiers](#S2_5_5_1)
      - [2.5.5.2 Semantics of Case Tags and Related Adverbs](#S2_5_5_2)
      - [2.5.5.3 Designing Case Tags and Related Adverbs](#S2_5_5_3)
  - [2.6 Generic State and Action Verbs](#S2_6)
    - [2.6.1 Generic State Derivations](#S2_6_1)
    - [2.6.2 Generic Action Derivations](#S2_6_2)
  - [2.7 Grammatical Voice](#S2_7)
    - [2.7.1 Implementation of a Grammatical Voice System](#S2_7_1)
    - [2.7.2 More on Middle Voice](#S2_7_2)
    - [2.7.3 Incorporating Oblique Case Roles](#S2_7_3)
    - [2.7.4 Summary of Grammatical Voice Nomenclature](#S2_7_4)
    - [2.7.5 Disjuncts](#S2_7_5)
    - [2.7.6 Voice Derivations](#S2_7_6)
    - [2.7.7 Voice Combinations](#S2_7_7)
  - [2.8 More on Causation](#S2_8)
  - [2.9 Focused versus Unfocused](#S2_9)
- [3.0 Nouns](#S3_0)
  - [3.1 Basic Noun Classes](#S3_1)
  - [3.2 Noun Design Algorithm and Examples](#S3_2)
  - [3.3 From Basic Noun to Other Parts-of-Speech](#S3_3)
  - [3.4 Semi-Roots Plus Verb and Adjective Classifiers](#S3_4)
  - [3.5 Abstract Nouns](#S3_5)
  - [3.6 Mass, Count, and Group Distinctions](#S3_6)
  - [3.7 Generic Nouns](#S3_7)
- [4.0 Case Tags](#S4_0)
  - [4.1 Review of Case Role Semantics](#S4_1)
    - [4.1.1 Non-Linking Adverbs and Case Tags](#S4_1_1)
    - [4.1.2 Case Role Terminology](#S4_1_2)
    - [4.1.3 Case Role Philosophy](#S4_1_3)
  - [4.2 Primary Case Roles](#S4_2)
  - [4.3 Secondary Case Roles](#S4_3)
    - [4.3.1 Instrument, Means, or Method](#S4_3_1)
    - [4.3.2 Secondary Patient, Beneficiary, and Maleficiary](#S4_3_2)
    - [4.3.3 Comitative (also called Accompaniment or Associative)](#S4_3_3)
    - [4.3.4 Location](#S4_3_4)
    - [4.3.5 Time](#S4_3_5)
    - [4.3.6 Reason](#S4_3_6)
    - [4.3.7 Manner](#S4_3_7)
    - [4.3.8 Case Tags for Exchange Verbs](#S4_3_8)
    - [4.3.9 State](#S4_3_9)
  - [4.4 Summary of Case Tag Forms](#S4_4)
  - [4.5 Additional Uses of the Focus Case Role](#S4_5)
- [5.0 Open Arguments and Modifiers](#S5_0)
  - [5.1 Open Adjectives](#S5_1)
    - [5.1.1 The Genitive](#S5_1_1)
  - [5.2 Open Nouns](#S5_2)
  - [5.3 Adjective Modifiers](#S5_3)
  - [5.4 Semantics of Open Nouns and Modifiers](#S5_4)
- [6.0 Additional Prefixes and Suffixes](#S6_0)
  - [no- Negator prefix](#negator)
  - [ne- Essential quality and ability prefix](#quality)
  - [-vay & -kwa Process and event suffixes](#process_event)
  - [-vi Infinitive/Participle suffix](#infinitive)
  - [-kaw Same arguments as first conjunct suffix](#kaw)
  - [-say Reflexive suffix](#reflexive)
  - [-vaw and -saw Reciprocal suffixes](#reciprocal)
  - [-ko Apply/Use suffix](#apply_use)
  - [-vye and -vyo Add and Remove suffixes](#add_remove)
  - [6.1 The Antonymic Semi-Root "bu-"](#S6_1)
- [7.0 Simple Generics](#S7_0)
  - [7.1 Omitted Arguments](#S7_1)
- [8.0 Polarity](#S8_0)
  - [8.1 Implementing Polarity](#S8_1)
- [9.0 Counts and Measures](#S9_0)
  - [9.1 Implementing Count Words](#S9_1)
  - [9.2 Implementing Measure Words](#S9_2)
  - [9.3 Other Numeric Derivations](#S9_3)
  - [9.4 More on the Semantics of Numbers](#S9_4)
- [10.0 Deixis](#S10_0)
  - [10.1 Personal Pronouns, Possessive Adjectives, and Possessive Pronouns](#S10_1)
  - [10.2 Demonstratives](#S10_2)
  - [10.3 Locative Deictics](#S10_3)
  - [10.4 Temporal Deictics](#S10_4)
- [11.0 Articles](#S11_0)
- [12.0 Comparatives](#S12_0)
  - [12.1 Unfocused Comparatives](#S12_1)
  - [12.2 More Complex Comparatives](#S12_2)
- [13.0 Diminutives and Augmentatives](#S13_0)
- [14.0 Register Variations (Honorifics and Pejoratives)](#S14_0)
  - [14.1 Lexical Register](#S14_1)
  - [14.2 Sentential Register](#S14_2)
- [15.0 Tense and Aspect](#S15_0)
  - [15.1 Implementing Tense and Aspect](#S15_1)
  - [15.2 Default Tense and Aspect](#S15_2)
  - [15.3 Further Derivation Using Tense-Aspect Roots](#S15_3)
  - [15.4 Polarity Plus Tense](#S15_4)
  - [15.5 Deictic Disjuncts](#S15_5)
- [16.0 Modality](#S16_0)
  - [16.1 Modal Concepts](#S16_1)
  - [16.2 The Semantics of Modality](#S16_2)
  - [16.3 Implementing Modality](#S16_3)
  - [16.4 Further Derivation Using Modal Roots](#S16_4)
  - [16.5 Are There Other Modalities?](#S16_5)
  - [16.6 Hedges](#S16_6)
  - [16.7 Order and Scope of Disjuncts](#S16_7)
  - [16.8 Imperatives](#S16_8)
- [17.0 Anaphora](#S17_0)
- [18.0 Relative Clauses and Resumptive Pronouns](#S18_0)
  - [18.1 Implementation of Relative Clauses](#S18_1)
  - [18.2 Nominal Relative Clauses Using "Tendaw"](#S18_2)
  - [18.3 Nominal Relative Clauses Using Inverse Case Tags](#S18_3)
  - [18.4 Non-Restrictive Relative Clauses](#S18_4)
- [19.0 Interrogatives](#S19_0)
  - [19.1 More on Nominal Relative Clauses](#S19_1)
- [20.0 Abstract Relationships](#S20_0)
- [21.0 Conjunctions](#S21_0)
  - [21.1 Implementing Conjunctions](#S21_1)
  - [21.2 Register Variations for Disjuncts](#S21_2)
  - [21.3 Coordination Ambiguity](#S21_3)
  - [21.4 Parenthetical Expressions](#S21_4)
  - [21.5 Quotes](#S21_5)
  - [21.6 Conditional Clauses](#S21_6)
- [22.0 Compounding](#S22_0)
  - [22.1 Implementing Compounds](#S22_1)
  - [22.2 Compounds from Other Derivational Morphemes](#S22_2)
  - [22.3 Mnemonic Derivations](#S22_3)
- [23.0 Topicalization](#S23_0)
- [24.0 Proper Names, Borrowed Words, Abbreviations, and Vocatives](#S24_0)
  - [24.1 Implementing Proper Names](#S24_1)
  - [24.2 Borrowed Words and Abbreviations](#S24_2)
  - [24.3 Vocatives](#S24_3)
- [25.0 Choosing Primitives: Vocabulary Design Strategy](#S25_0)
  - [25.1 Single Words or Compounds?](#S25_1)
  - [25.2 Exchange Verbs](#S25_2)
  - [25.3 Groups of Related Concepts - Color Terms](#S25_3)
  - [25.4 Groups of Related Concepts - Kinship Terms](#S25_4)
  - [25.5 Telling Time](#S25_5)
  - [25.6 Spellings](#S25_6)
- [26.0 A Sample Derivation](#S26_0)
- [27.0 Using Words: Literalness, Polysemy, Metaphor, and Idiom](#S27_0)
- [28.0 Final Word on Focus](#S28_0)
- [29.0 Summary: A Comprehensive Lexico-Semantic System](#S29_0)

<!-- -->

- [APPENDIX A: The Phonology and Morphology of the Interlingua](#APPENDIX_A)
- [APPENDIX B: Prefixes, Suffixes, and Compositional Roots of the Interlingua](#APPENDIX_B)
- [APPENDIX C: Classifiers of the Interlingua (with examples)](#APPENDIX_C)
- [APPENDIX D: Semi-roots of the Interlingua (with modifier meanings)](#APPENDIX_D)
- [APPENDIX E: Syntax of the Interlingua](#APPENDIX_E)

------------------------------------------------------------------------

<span id="preface"></span>

> ## Preface
>
> This monograph is a reference manual for a machine translation interlingua. It is still in the draft stage, and will be undergoing continuous revision as the software based on it is developed and tested. If you have any helpful comments or suggestions, please feel free to contact me at [ram@eskimo.com](mailto:ram@eskimo.com.). If you do contact me, please quote sparingly from the monograph.
>
> The latest version of this document can be found at <http://www.eskimo.com/~ram/lexical_semantics.html> or <http://www.axxess.net/~ram/lexical_semantics.html>. A tutorial (including audio wav files) and dictionaries for the interlingua can be found at <http://www.eskimo.com/~ram/Nasendi/index.html> or <http://www.axxess.net/~ram/Nasendi/index.html>. These files are also works in progress. As time goes by, the dictionaries will be expanded and more self-study lessons will be added.

<span id="S1_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 1.0 Introduction

In this monograph, I would like to discuss word design for an artificial language designed specifically for use as an interlingua in machine translation. Such a language must be designed to meet two primary goals: first, it must be easier to accurately translate from the source natural language into the interlingua than into another natural language; and, second, it must be almost trivially easy (i.e., requiring simple computer programming) to accurately translate from the interlingua into the target language. In other words, mapping between natural languages and the interlingua must be both accurate and made as easy as possible.

The interlingua achieves these goals by means of its simple but powerful derivational morphology which makes word design rigorous yet straight-forward, while at the same time greatly reducing the number of basic morphemes (i.e. *primitives*) required by the language.

Initially, I will not try to describe this method in abstract terms, since this discussion is intended for the non-linguist. Instead, I will present the reader with many examples of various kinds of linguistic constructions, discuss the semantics of these constructions, introduce linguistic terminology where and as needed, and finally, try to derive some useful generalizations. <span id="S2_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 2.0 Verbs

I'll start this exposition by looking first at verbs. Specifically, I will look at two of the most important criteria that go into defining a verb: its *valency* (i.e. the number of basic arguments that it requires) and its *case requirements* (i.e. the semantic roles played by the basic arguments). When combined, the valency and case requirements of a verb are usually referred to as the *argument structure* of the verb.

Before proceeding, though, let me give you a quick review of valency and case. Consider the following English sentence:

        The chimpanzee broke the window with a coconut.

In this example, the verb "break" has a valency of two, since it requires two arguments: the subject "the chimpanzee" and the object "the window". The arguments are **required** because, if either were missing, the resulting sentence would be ungrammatical (or, in the case of some verbs, would have a different meaning):

        *The chimpanzee broke.
        *Broke the window.

\[Please note that I am using the standard linguistic convention of indicating an unacceptable item by preceding it with an asterisk.\]

But the following is okay:

        The chimpanzee broke the window.

For the verb "break", the case role of the subject is *agent*, and indicates the entity **responsible** for the event. The case role of the object is *patient*, and indicates the entity which **experiences** the state or change of state described by the verb. In other words, the argument structure of the English verb "break" requires two arguments: the first argument (i.e. the subject) must be a semantic agent, and the second argument (i.e. the object) must be a semantic patient.

Arguments required by a verb are called *core* arguments.

The phrase "with a coconut" is what is called an *oblique* argument since it is not essential for the sentence to be grammatical. It simply provides additional peripheral information about what happened. In this sentence, it indicates the *instrument* of the event. In other words, "a coconut" is the instrument used in carrying out the act indicated by the verb. If the sentence had been:

        The chimpanzee broke a thousand windows in Boston on Tuesday.

then "in Boston" would be a locative oblique argument, and "on Tuesday" would be a temporal oblique argument.

\[The case terminology that I am using here is fairly common, but not universal. Linguists who work with case grammar and thematic relations have yet to agree on the number and nature of case roles needed to adequately describe natural language. As it turns out, this lack of agreement is irrelevant to what we are trying to accomplish here. We will, in effect, create our own internally consistent, semantically precise, and easily expandable implementation of a case system.\]

In English, oblique arguments are usually *marked* by preceding them with a preposition. Thus, the preposition is the marker which tells us the case role of whatever follows it. Agent and patient are almost always *unmarked*. The most common exception to this in English is in passive constructions, where the original subject is preceded by the preposition "by", as in "the window was broken BY the chimpanzee" or "the thieves were seen BY the children". Some verbs, such as English "put", have a third, required argument (i.e., it is part of the valency of the verb), which is marked by a preposition. For example:

        *He put the book.
        He put the book on the table.

Here, the preposition "on" marks a *destination* case role.

Incidentally, natural languages often allow a speaker to omit a core argument if it is obvious from context. For example, a Japanese speaker often omits the agent of a verb as a sign of politeness. This usage, however, performs a discourse function - **not** a grammatical function - and the omitted argument is still assumed to be present.

An additional case role that occurs within the valency of many verbs is what I will call *focus*. Linguists often call this case role *theme*, *object*, or *topic*, but there is no consensus, and their definitions often overlap other roles, especially patient. In all of the following examples, the direct object is the focus:

        The children saw the thief.
        The team needs a new coach.
        The woman remembered her father.
        The boys are playing baseball.
        The woman owns a beach house.
        The tarp covered the boxes.
        The fans enjoyed the game.
        The employees learned discretion.
        The man ignored his wife.
        The choir is singing a requiem.
        The boy loves his mother.
        The class is studying French.
        The fence surrounds three buildings.
        The old man told a story.

Note that in each of the above sentences, the direct object provides a reference point or focus for the event, without causing or being changed by the event. It does this by pinpointing, narrowing down, or providing a reference for (i.e. 'focusing') the state or change of state indicated by the verb. Note that a focus does not play an active role in the event described by the verb, and is not obviously changed by the event. Thus, a focus can be best described as one of the following:

        1. The entity on which the patient's attention or mental
        state is 'targeted' or 'focused'; e.g. to see, to play, to
        learn, to love, to tell, etc.

        2. The referent of a relationship with the patient (i.e. the
        patient's state relative to the focus); e.g. to own, to
        surround, to include, to need, etc.

        3. An elaboration of the event itself; e.g. to play, to
        sing, to tell, etc.

Note that the concepts can overlap, as in "to need", "to avoid", "to know", and "to hate", since the object of such verbs can be considered the focus of a relationship *or* of a mental state. In fact, without stretching the second definition too much, one could say that it applies to **all** focused events, even those involving perception or elaboration. For example, the sentence "John sees the forest" describes a relationship between "John" and "the forest", and the sentence "Louise sang a little ditty" describes a relationship between "Louise" and "a little ditty".

Thus, we can say that the patient experiences a relationship whose referent is the focus. If the verb has an agent, then the agent is responsible for the relationship. The nature of the relationship is indicated by the meaning of the verb. It is important to keep in mind that the focus does not directly modify or interact with the patient. Perhaps the best and most useful generalization we can make is that the focus is the referent of a relationship with the patient, it is not affected by the event, and it is not responsible for the event. However, the precise meaning of the focus will ultimately depend on the meaning of the verb itself.

Thus, it would appear that focus is not really a pure case role. Both agent and patient can be defined with semantic precision, while focus seems somewhat vague or even 'out-of-focus'. The reason for the vagueness is that it is possible to differentiate among the various senses of focus; e.g. the perceived entity ("to see"), the missing/lacking entity ("to need"), the locative reference point ("to surround"), an elaboration of the event itself ("to sing"), etc. But these senses never overlap for a particular verbal concept, and we would end up making distinctions that are never made in natural languages. Thus, focus *is* a vague and general-purpose case role, but it is an essential one.

In summary, the three major case roles that are capable of being included within the valency of a verb are:

        agent - the entity responsible for the event described by the verb

        patient - the entity which experiences the state or change of state
                  described by the verb

        focus - the entity which acts as the referent of a relationship
                with the patient

Thus, the agent is responsible for the event, the patient experiences the event, and the focus provides the referent for the state or change of state indicated by the event. \[We will discuss the semantics of focus in more detail [later on](#S28_0). First, though, we need to acquire a more substantial background in the semantics of verbs.\]

Note that an argument does not have to be a physical entity. It can also be an event. In the following examples, the direct object is the patient:

        We lengthened our trip.
        The police halted the procession.
        Bill chaired the seminar.
        Joe postponed the finance committee meeting.
        The army prevented the destruction of the village.
        The station repeated the broadcast.

There are other case roles in addition to the ones I just mentioned, but they are all oblique (i.e., they are never required by a verb). I will discuss them as the need arises. For now, though, we have enough background to proceed with the discussion.

In the following sections, I will discuss and classify a large number of English verbs, based on their semantics and their argument structures. While doing so, I will also introduce some of the terminology and the formal descriptive notation that I will be using throughout the remainder of this monograph. <span id="S2_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.1 Verb Classification - State Verbs

Probably the largest group of verbs in English (or any language, for that matter) are called *state* verbs, since they describe either an unchanging state of affairs or a change of state. Verbs which describe an unchanging or static situation are often called *stative* verbs (do not confuse "stative" verbs with "state" verbs). Verbs which describe a changing or dynamic situation are often called either *process* or *accomplishment* verbs. Because linguists do not agree on the precise meanings of these terms, I will immediately abandon them and use the more generic expressions "static state verbs" and "dynamic state verbs".

Let's start by looking at some static state verbs; i.e. verbs which describe a steady or ongoing state:

        The patients suffered.
        The boy sweated.
        The building shook.
        The baby slept.
        The fish stank.
        The stars twinkled.

These verbs are all *intransitive*; i.e. they have a subject but no object. Also, each one describes the steady, ongoing state of the subject. Thus, the subject is the patient. From now on, I will refer to verbs of this type as "P-s", where "P" represents "patient" and "-s" indicates that the verb is a **static** verb.

Here are some more static state verbs with the form P-s:

        The trees were tall -> P-s verb = "to be tall"
        The door was closed -> P-s verb = "to be closed"
        The stew was salty  -> P-s verb = "to be salty"
        The walls were blue -> P-s verb = "to be blue"
        The mouse was dead  -> P-s verb = "to be dead"

English speakers may be surprised to see adjectives and past participles being treated as descriptive verbs. However, words which describe steady states have just as much of a verbal nature as words which describe changes of state. The English verbs "to sleep", "to stink", "to twinkle", etc. illustrate this very well. In fact, many natural languages (e.g. Japanese, Korean, several Sino-Tibetan languages such as Mandarin Chinese, some Siouan languages, several Austronesian languages, and many native languages of Africa, Central America and South America) do not have true adjectives. Instead, these languages use words that are essentially intransitive verbs, and which can be inflected or otherwise used in the same way as any other intransitive verbs.

Now, the above examples represent intransitive **static** state verbs. Here are some examples of intransitive **dynamic** state verbs:

        The window broke.
        The ice melted.
        The plants grew.
        The baby fell asleep.
        The mouse died.
        The stew cooled.
        The patient recuperated.

The only difference between these and the previous examples is that the patient experiences a **change** of state rather than a steady state. Thus, these verbs are the dynamic counterparts of the intransitive static state verbs.

From now on, I will refer to these verbs as "P-d", where "-d" indicates that the verb is a **dynamic** verb.

Next, let's look at some verbs which describe events in which the subject causes something to happen to the object. These verbs are all *transitive*; i.e. they have both a subject and an object. Here are a few examples:

        He cured the patient.
        He broke the window.
        He killed the mouse
        He closed the door
        He salted the stew
        He captured the thief.

In all of the above, the subject "He" is responsible for the event described by the verb. Also, in all cases, the event causes a change of state to occur in the object. Thus, the subject is the agent and the object is the patient. In other words, these verbs are transitive dynamic state verbs.

For verbs like these, I will use the notation "A/P-d", where "A" represents "agent", "P" represents "patient", a slash "/" separates subject from object, and "-d" indicates that the verb is a dynamic verb.

Note that English, unlike almost all other languages, uses exactly the same word for **some** of its P-d and A/P-d verbs:

        P-d:        The window broke.
        A/P-d:      John broke the window.

        P-d:        The patient healed.
        A/P-d:      The doctor healed the patient.

Note though, that this usage is highly idiosyncratic, and many words that you would expect to follow the pattern do not:

        A/P-d:      The doctor cured the patient.
        P-d:        *The patient cured.

        P-d:        The patient recuperated.
        A/P-d:      *The doctor recuperated the patient.

        A/P-d:      The cat killed the mouse.
        P-d:        *The mouse killed.

        P-d:        The mouse died.
        A/P-d:      *The cat died the mouse.

So far, we've seen P-s, P-d, and A/P-d verbs. Thus, an obvious question is: are there such things as A/P-s verbs?

Yes. And as the designation implies, these verbs always indicate that the agent maintains the patient in some kind of steady state. Thus, all of these verbs imply that the agent somehow "controls" the patient. Here are some examples:

        He is operating the lathe.
        He rules the country.
        He conducted the orchestra.
        He chaired the symposium.
        He holds the knife.
        He used the hammer.
        He will prevent the accident.
        He manages the company.
        He is bringing the children.

Note that, although these verbs may imply both an entry into and an exit from the event or situation, the major emphasis is on the process BETWEEN the endpoints. For these reasons, these verbs are static rather than dynamic.

Now, for states that are normally rendered using adjectives, English uses the particle "keep" to distinguish between A/P-s and A/P-d verbs. Here are some examples:

        He kept the door open.      A/P-s verb = "to keep open"
        He kept the girl alive.     A/P-s verb = "to keep alive"
        He kept the thief captive.  A/P-s verb = "to keep captive"
        He kept his mother happy.   A/P-s verb = "to keep happy"

All of the above are effectively A/P-s verbs. English simply uses the particle "keep" to achieve the desired effect. A good paraphrase of these 'verbs' is "agent causes patient to remain in a steady state".

Next, let's look at some verbs that use the focus case role that we discussed earlier. Here are some examples:

        The student needs money.
        The boy misses his father.
        The company owns the yacht.
        The child has the coloring book.
        The report lacks a cover.
        The kids enjoy the game.
        The man loves his wife.
        The policeman sees the thief.
        The girls hear the music.

In all of the above, the subject experiences a steady state relative to the object. Thus, the subject is a patient, the object is a focus, and the verb is a static state verb. For these verbs, I will use the notation "P/F-s", where "F" represents the focus.

It is also possible to have verbs like these which also have an agent. Here are some examples:

        The boy imitated the teacher.
        The lady looked at the house.
            (Think of "to look at" as a single complex verb.)
        The men obeyed the rules.
        The girls listened to the music.
            (Think of "to listen to" as a single complex verb.)
        The children followed their parents.
        The priest thought about his sins.
            (Think of "to think about" as a single complex verb.)

In the above examples, the subject not only experiences the steady state indicated by the verb, but is also responsible for the state; i.e., the subject is also in control. Thus, the subject is both the agent **and** the patient, and the object is the focus. I will refer to these verbs as AP/F-s.

Incidentally, notice how some of the above complex verbs become simple verbs when they are defocused:

        The lady is looking.
        The lady is looking at the house.

        The girls are listening.
        The girls are listening to the music.

        The priest is thinking.
        The priest is thinking about his sins.

Thus, the unfocused verbs would be described as AP-s.

It is also possible for AP/F verbs to indicate a change of state. Here are some examples:

        Louise befriended her classmate.
        Mike joined the party.
        John memorized the poem.
        He entered the room.
        The teacher took the book.
        Mary divorced him two years ago.
        The man disowned his oldest son.
        Bill left the building.

These verbs describe a situation in which the agent causes **himself** to undergo a change of state relative to the focus. Thus, they are all AP/F-d.

Since all of this may be confusing, let me paraphrase the relationships in a way that illustrates the states and how they are focused:

        P/F-s: John saw the mouse.  = John experienced a visually
            perceptive state focused on the mouse.

        AP/F-s: John looked at the mouse.  = John maintained himself in
            a visually perceptive state focused on the mouse.

        P/F-d: John noticed the mouse.  = John entered a visually
            perceptive state focused on the mouse.

        AP/F-d: John glanced at the mouse.  = John caused himself to
            enter a visually perceptive state focused on the mouse.

        P/F-s: The platoon heard the music.  = The platoon experienced
            an aurally perceptive state focused on the music.

        AP/F-s: The platoon listened to the music.  = The platoon
            maintained itself in an aurally perceptive state
            focused on the music.

        P/F-d: John remembered the party.  = John entered a state of
            remembrance focused on the party.

        AP/F-d: The platoon surrounded the village.  = The platoon
            caused itself to be in a state of 'around' focused
            on the village.

        P/F-s: He loved his father.  = He experienced a state of loving
            focused on his father.

        P/F-d: She learned discretion.  = She entered a state of
            knowledge focused on discretion.

Overall then, verbs in this group can be generalized as follows:

        P/F-s: Static, subject = patient only (to hear, to love)
            X experienced a steady state focused on Y

        AP/F-s: Static, subject = agent & patient (to look at, to listen to)
            X maintained himself in a steady state focused on Y

        P/F-d: Dynamic, subject = patient only (to remember, to learn)
            X underwent a change of state focused on Y

        AP/F-d: Dynamic, subject = agent & patient (to glance at, to surround)
            X caused himself to undergo a change of state focused on Y

Note that in all of the above paraphrases, the words "focused on" could be replaced by the words "relative to", emphasizing that the focus is the referent of a relationship with the patient. <span id="transfer_verbs"></span>

Now, some verbs involve the exchange of one item for another, usually between two people. Here are some examples:

        John swapped an apple for an orange with Bill.
        John sold Bill a book for $10.
        Bill bought a book from John for $10.
        John loaned Bill his tiller for $10.
        Bill rented a tiller from John for $10.

In each case, two transfers of possession take place. John loses possession of one item while gaining possession of another, and the reverse change of possession occurs for Bill. Thus, we have, in effect, two patients and two foci, where the foci are the items being exchanged.

We can also regard these verbs as composites; i.e. useful abbreviated versions of two distinct verbs, as in "John gave me his apple and I gave him my orange".

Since both patients are equally responsible for the exchange, each one functions as both agent and patient. However, the subject in the above exchanges plays a more important or 'primary' role as agent than the other patient, and the first item plays a more important or 'primary' role as focus. Thus, for example, in the case of "sell", the seller is the primary agent-patient, while the buyer is the 'secondary' agent-patient. The object sold is the primary focus, and the amount paid is the 'secondary' focus.

\[This is not the only possible analysis, but I feel that it is the most practical. It also eliminates the need for any special treatment of exchange verbs that do not need a secondary focus, such as "to lend/borrow".\]

Finally, there are some cases where the subject is the **only** agent-patient, as in "John swapped his brown tie for a blue one". Here, John causes himself to undergo a change of relationship with two different items, without the involvement of anyone else. In this example, "a blue one" is the secondary focus.

There are also state verbs which are used to describe the weather and other environmental phenomena. Here are some examples:

        It's raining.
        It stinks in here.
        It's windy.
        It's cold outside.
        It's snowing.
        It's scary in there.
        It's humid today.
        It's dark in there.
        It's getting hot = it's heating up.
        It's getting cloudy = it's clouding up.
        It's quiet when the kids are at school.

In this group of verbs, the subject is the null place holder "it". English verbs always require a subject in the indicative, but this is not true of most languages.

Note that verbs in this class can be either static or dynamic. Also note that, since these verbs describe states or changes of state, they have an **implied** patient which is obvious from the context (i.e. the local environment or current situation). In effect, English uses the pronoun "it" to represent the implied patient.

I will not describe the argument structure of these verbs right now, because we do not yet have a sufficient background to treat them properly. Instead, I will postpone their discussion until after we discuss [grammatical voice changes](#S2_7). <span id="S2_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.2 Verb Classification - Dynamism and Telicity

So far, all of the verbs we have discussed are state verbs. That is, the basic concept represented by such a verb is some kind of state, and that this state applies only to the patient. The states can be focused or unfocused, and they can be brought about or maintained with or without an agent.

Also, the states themselves can be categorized by their dynamism; i.e. a state can be "energetic" (e.g. 'alive', 'twinkling', 'sleeping', 'smelly', etc.) or "non-energetic" (e.g. 'dead', 'green', 'tall', etc.). In general, an energetic state can be described using an English present participle, and a non-energetic state can be described using an English adjective or past participle, but there are many exceptions.

Verbs may also be categorized according to their *telicity*. Dynamic verbs that have a built-in endpoint are called *telic*, as in "The violinist played a dirge". Dynamic verbs that do **not** have a built-in endpoint are called *atelic*, as in "The violinist played with the local orchestra".

Unfortunately, distinctions in dynamism and telicity are not very useful, and I know of no natural languages that mark these distinctions. Whether a concept is energetic or not is a basic part of the nature of the concept and has nothing to do with how the concept is applied. In other words, it is an inherent part of meaning of the verb root, and there is no need to mark it or express it externally.

Also, the telicity of a verb often depends on the meaning of its arguments rather than on the form of the verb. Thus, in a derivational system such as I am presenting here, telic distinctions are useless.

\[Incidentally, this entire section is 'for your information only'. I felt that it was important to mention dynamism and telicity only because linguists attribute so much importance to these concepts in their theoretical discussions about verbs. In my opinion, distinctions in dynamism and telicity are interesting but useless for our purposes. And, as I will illustrate below, there is a much more important and useful distinction: the distinction between agent-oriented concepts and patient-oriented concepts.\] <span id="S2_3"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.3 Verb Classification - Action Verbs

State verbs are not the only kind of verbs that languages employ. There is one other class of verbs, which I will refer to as *action* verbs, which differ significantly from state verbs. Let's look at a few examples and then see if we can deduce some useful generalizations:

        Louise told Bill a joke.
        Louise kicked Bill.
        Louise teased Bill.
        Louise betrayed Bill.
        Louise pushed Bill.
        Louise punished Bill.

In each of the above examples, the subject "Louise" is clearly the agent. Also, in the first example, the second object is clearly the focus. But what is the object "Bill"?

In each case, Louise is trying to have some kind of effect on Bill, but the final result is not clear. For example, when Louise kicks Bill, we know that something happens to Bill, but Bill's final state depends on many things that are left unstated, such as how hard she kicked, what kind of shoes she was wearing, where she kicked Bill, and so on. This is quite different from state verbs, where the final state is always clearly indicated by the meaning of the verb. For example, the sentence "He broke the window" makes it very clear what the final state of the window is; i.e. 'broken'. It doesn't tell us anything about the act itself or how it was accomplished. Now, we could say that Bill's final state is 'kicked', but this does not tell us about his condition - it simply tells us how it was accomplished.

The reason why the final outcome of the above examples is not clear is because these verbs tell us about the act itself rather than the outcome of the act. In other words, these verbs emphasize what the agent is doing rather than emphasizing what is happening to the patient. Another way of putting it is that an action verb tells us how a patient was affected, but does not tell us what the resulting state is. A state verb is exactly the opposite - it tells us the state of the patient without telling us how the state was achieved.

Thus, state verbs are *patient-oriented*, since they highlight what the patient experiences. Action verbs are *agent-oriented*, since they emphasize what the agent is doing.

If a root concept is patient-oriented, then the verb will indicate what the patient experiences. Patient-oriented verbs may or may not have agents. If the root concept is agent-oriented, then the verb will indicate what the agent is doing. An agent-oriented verb **must** have an agent. All patient-oriented verbs are state verbs. All agent-oriented verbs are action verbs.

The most common action verbs are *speech acts*. Here are some examples:

        He advised his clients.
        He blessed the crowd.
        He told me a joke.
        He mocked them.
        He answered the teacher.
        He called me an idiot
        He blamed John for the accident
        He dared me to try it
        He promised me that he would come early.

In all of the above the first object is the patient, since it is the entity which the agent is trying to affect. For the verbs which have two objects, the second object is the focus. Thus, in the sentence "He told me a joke", "He" is the agent, "me" is the patient, and "a joke" is the focus.

Verbs which have two objects are called *ditransitive*.

Finally, we mentioned earlier that the focus of a verb can be one of the following:

        1. The entity on which the patient's attention or mental state
           is 'targeted' or 'focused'; e.g. to see, to play, to learn,
           to love, to tell, etc.

        2. The referent of a relationship with the patient (i.e. the
           patient's state relative to the focus); e.g. to own, to
           surround, to include, to need, etc.

        3. An elaboration of the event itself; e.g. to play, to sing,
           to tell, etc.

We can now state a very important observation regarding the focus of action verbs:

        The focus of ALL action verbs MUST be (3) above.

However, there can still be an overlap. Thus, although an action verb **must** be in category (3), it can also be in another category. For example, because "sing" is an action concept, the focus must elaborate the event, as in "John sang a little ditty". However, it can also fall into category (1), since the object "a little ditty" can be considered the focus of the mental state of the patient.

There is another group of action verbs that are typically referred to as *activities*. Here are some examples:

        The children played (hide and seek).
        The athletes ran (the marathon).
        The guests danced (the polka).
        The old hag smoked (a pipe).
        The boy read (a good book).
        The prisoners ate (their suppers).
        The hawk flew (in circles).

These verbs describe situations in which the agent maintains itself in an ongoing, energetic state. As a result, these verbs are all static AP/F-s verbs, and can be paraphrased as "Agent does something to maintain itself in a steady, active state". In effect, since the agent and the patient are the same, and since an action verb tells us what the agent is doing, it also tells us the state of the patient. In other words, the action and the state are essentially the same.

\[Incidentally, some readers might argue that the objects of the verbs "smoke" and "read" in the above examples do not elaborate the event, as is required of all action verbs. However, I disagree. Just because the objects "a pipe" and "a good book" are noun phrases representing physical objects does not mean that they cannot represent events. In fact, these simple noun phrases actually evoke complete events because of their inherent natures. A book does not serve its main purpose if it is not read and a pipe does not serve its main purpose if it is not smoked. Similarly for verbs like "eat" and "drink".\]

Now, many activity verbs **can** take an explicit patient that is not also the agent. Here are some examples:

        John played Bill three games of chess.
        The athletes ran their sneakers threadbare.
        His wife danced him into a stupor.
        She smoked us out of the house (i.e., her smoking
            caused us to leave).
        The boy read his sister a story.
        The hawk flew the mouse in circles.

In these examples, we are still saying what the agent is doing while placing more emphasis on what is being done to someone/something else. Thus, these verbs are the A/P versions of the basic activities. And in all of them, the patient takes a direct part in the activity.

\[Incidentally, the word "threadbare" in the "run" example, and the expressions "into a stupor" in the "dance" example and "out of the house" in the "smoke" example are called *resultatives*, since they indicate the final or 'result' state of the patient. Also, the first example using "play" could also be analyzed as a *reciprocal* construction. We'll have more to say about [resultatives](#S4_3_9) and [reciprocals](#reciprocal) later.\]

It's important to emphasize that, when dealing with action concepts, we cannot treat AP derivations as we did with state verbs. In an AP state derivation, the agent is causing itself to experience the state that normally applies only to the patient. In an AP action derivation, the agent is causing the patient to perform the action that is normally performed only by the agent.

In other words, in an AP state derivation, the agent **experiences** the same thing (i.e. state) as the patient. In an AP action derivation, the patient **does** the same thing (i.e. action) as the agent.

Thus, an AP-s version of a verb such as "to kick" does **not** mean that the agent kicks himself. Instead, it means that the agent is simply "kicking"; i.e., he is involved in the activity of "kicking" with no specified or discernible target. This is a subtle distinction, but it is an extremely important one.

\[Incidentally, this distinction could also be handled by designating the above verb as simply A-s rather than AP-s. However, I have chosen to keep the AP notation because of the inherent symmetry of the distinction, and because it emphasizes that the agent is causing itself to experience what is essentially an energetic "state".\] <span id="S2_4"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.4 Generalizations About Verbs

Now, let's look at some of the distinctions that exist among these categories, and see if we can make some generalizations about verbs. In looking over the above groupings, we can draw the following conclusions:

        1. All verb concepts are either:
            a. Patient-oriented -> the root describes the ongoing
               or final state of the patient.
            b. Agent-oriented -> the root describes what the agent
               is doing.

        2. All verbs are either:
            a. Static verbs -> these indicate that the patient
               experiences a steady state.
            b. Dynamic verbs -> these indicate that the patient
               experiences a change of state.

        3. The subject of a verb can be any of the following:
            a. Agent
            b. Patient
            c. Both agent and patient
            d. Nothing

        4. The object of a verb can be any of the following:
            a. Patient
            b. Focus
            c. Nothing

        5. Some verbs take three arguments.  In these cases, the
           subject is the agent, the first object is the patient,
           and the second object is the focus.

        6. All verbs have a patient, whether stated or implied.

As mentioned earlier, there are a few odd-balls which have unusual argument structures, but these are rare and tend to be irregular or idiosyncratic. For the time being, we will limit our discussion to the larger, more regular categories. \[Actually, as we will see throughout this monograph, the so-called 'odd-balls' can **always** be derived from more regular verbs via some form of grammatical voice change or derivational modification.\]

From the above list, we might be tempted to create a matrix of 2x2x4x3x2 = 96 elements. However, most combinations never appear. Note, for example, that the orientation of the verb is an inherent part of the meaning of the root, and we will never find two verbs that differ **only** in this characteristic. Also, a patient can be the subject OR the object - not both - which, of course, makes sense. And if the first argument is both agent and patient, then the second argument cannot be a patient. Also, it serves no useful purpose to have a verb with an object but with no subject. And so on.

With all of the above in mind, we can construct a chart of the possible forms that verbs can take:

        ARGUMENTS     STATIC          DYNAMIC      
        -------------------------------------------
        A/P/F         to conduct      to tell
        A/P           to manage       to cure
        AP/F          to ignore       to memorize
        AP            to behave       to escape
        P/F           to see          to recall
        P             to stink        to recuperate
        none          to be cloudy    to cloud up

Note that I have excluded verbs that take instrumental subjects (e.g. "The hammer broke the window"). English is one of the very few languages that allows constructions like this. And those few that do allow this generally mark the verb to indicate that the subject is instrumental (e.g. Malagasy, many Bantu languages, many Philippine languages, etc.). <span id="S2_5"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.5 Verb Design Algorithm

So, how do we apply these generalizations to the practical problem of verb design? Answer: we do it by **classifying** and **marking** our verbs (in some way or other) to indicate their valency, case requirements, and whether or not they reflect a steady state or change of state. The easiest way to do this is to design the morphology of the language to reflect these differences. For example, the following English verbs will all be derived from the same root but will have different markers to indicate their different argument structures:

        AP-d        to escape
                    = Agent causes self to become free
        AP/F-d      to escape from
                    = Agent causes self to become free relative to
                            focus

        A/P-d       to release, to free, to liberate
                    = Agent causes patient to become free
        A/P/F-d     to release from, to free from
                    = Agent causes patient to become free relative
                            to focus

        P-d         to get loose, to become free
                    = Patient becomes free
        P/F-d       to get loose from, to become free of
                    = Patient becomes free relative to focus

        AP-s        to stay free, to remain free
                    = Agent keeps self free
        P-s         to be free
                    = Patient is free

And so on. For all of the above, we can use a state root with the meaning 'free/unrestrained', and can apply a different marker to indicate whether the result is AP-s, A/P-d, etc. <span id="S2_5_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.5.1 The Morphotactics and Pronunciation of the Interlingua

\[If you have difficulty understanding the formal description that follows, I suggest that you read my separate essay entitled ["Morphology"](http://www.eskimo.com/~ram/morphology.html). The essay provides a brief and simple tutorial on how to describe the shapes of words and morphemes. However, it is not necessary to understand how words are shaped in order to understand the lexical semantic system discussed in this monograph.\]

Here is a formal description of the morphology of the interlingua:

Definitions:

        () indicates that the enclosed item is optional
        {} indicates that the enclosed item may appear zero or more
           times
        [] indicates that the enclosed item must appear one or more
           times
        | ::= logical or
        V ::= any vowel ::= a | e | i | o | u
        S ::= any semi-vowel ::= w | y
        C ::= any consonant ::= b | c | d | f | g | j | k | l | m
                    | n | p | q | r | s | t | v | x | z

A vocalic nucleus N has the following form:

        N ::= (S) V (S) (V) (S) ...

        examples: e, yo, we, aw, ay, iwa, ayu, ea, etc

More precisely, a vocalic nucleus can consist of one or more vowels, and, if there is more than one vowel, then 'i' or 'u' is converted to the corresponding semi-vowel 'y' or 'w'. For example, "eua" becomes "ewa". I'll have more to say about this later.

A morpheme has the form:

        morpheme ::= C N (n)

            examples: ke, vay, poa, sen, boya, diwan, etc

A prefix has the form:

        prefix ::= n N (n)

            examples: ni, naw, nen, noy, etc

A suffix has the form:

        suffix ::= d N  or  k N  or  s N  or v N

            examples: sa, dwa, koyu, vay, etc

A suffix changes the syntax and semantics of a word in a precise (i.e., totally predictable) way. For example, if we add the A/P-d suffix "-vyu" to the root "ju" (meaning 'dog'), the result "juvyu" means 'to turn P into a dog', which is a dynamic state verb. In other words, we have changed both the syntax and meaning from a 'dog' noun to a 'change-of-state' verb. In fact, even a simple part-of-speech change that does not change the argument structure **does** change the syntax because the two different words can not be used in the same context. For example, "konda" (meaning 'to know') and "kondi" (meaning 'knower') cannot be used in the same context because "konda" is a verb that requires arguments while "kondi" can only **be** an argument.

In summary, a prefix modifies the meaning of the entire word that follows it without changing its syntax. A suffix changes both meaning and syntax of the root plus any intervening suffixes. In other words, we start with the root, add the suffixes, and then add the prefixes to obtain the final meaning.

Many suffixes have a default part-of-speech. Thus, an additional part-of-speech suffix is not needed if the default applies.

A root-terminator has the form:

        root-terminator ::= m N  or  p N

            examples: mi, pya, moyu, paw, etc

Root-terminators are used for closed class words that have unusual syntactic or semantic properties, such as demonstratives, conjunctions, quantifiers/numerics, locatives, and particles.

A semi-root has the form:

        semi-root ::=
        any morpheme not reserved for prefixes, suffixes, and root
        terminators.  Note that this includes morphemes that start
        with 'd', 'k', 's', 'v', 'm', and 'p', and end with 'n'.
        For example, "san" is a valid semi-root even though "sa"
        is a suffix.

A root is defined as follows:

        unterminated-root ::= [semi-root]
        terminated-root   ::= {semi-root} root-terminator

        root ::= unterminated-root | terminated-root

The rightmost morpheme of a root is called the "classifier" of the root.

Finally, words have the following forms:

        word ::= {prefix} unterminated-root [suffix]
           | {prefix} terminated-root   {suffix}

Note that a root-terminator may be preceded by zero or more semi-roots **but may not be followed by one**. Thus it automatically terminates a root. Because of this, root-terminators will have a default part-of-speech, and a separate part-of-speech suffix will not be needed if the default applies. Unterminated roots must **always** be followed by at least one suffix which will terminate the root and indicate the part-of-speech.

As for pronunciation, vowels are cardinal, although laxer versions are acceptable (i.e., pronounce vowels as in Italian or Swahili). Pronounce /w/ as in "awake", /y/ as in "soybean", /c/ like "ch" in "chin", /j/ as in "judge", /x/ like "sh" in "ship", /q/ like "s" in "measure", and /r/ as any rhotic (flap, trill, retroflex, uvular, etc). The consonant /h/ may be pronounced like 'h' in "house", as a glottal stop (i.e., like "tt" in "button"), or as \[x\] (i.e., like "ch" in German "acht"). \[More generally, /h/ may be pronounced as a glottal stop or as any unvoiced velar, uvular, pharyngal, or glottal fricative.\]

If 'n' precedes another consonant, it may be pronounced homorganically. For example, "tenpo" can be pronounced like English "tempo", and "lingo" can be pronounced exactly as in English.

Geminates (i.e., two or more consecutive, identical vowels, semivowels, or consonants) are not allowed. For example, "xx", "bb", "uu", and "yy" are not allowed. The sequences /uw/, /wu/, /iy/, /yi/, /ou/, /ow/, /ei/, /ey/, /ao/, /ae/, /wy/, and /yw/ are also not allowed. However, it is always legal to pronounce /e/ as either \[e\] or \[ey\], and /o/ as either \[o\] or \[ow\]. For example, /ea/ may be pronounced \[ea\] or \[eya\], and /oa/ may be pronounced \[oa\] or \[owa\]. The vowels 'i' and 'u' may never appear adjacent to another vowel - use 'y' or 'w' instead. For example, the roots "faija" and "tuenze" are illegal, but "fayja" and "twenze" are legal. If 'i' and 'u' are adjacent, convert the first to a semi-vowel. Thus, "ui" becomes "wi" and "iu" becomes "yu".

Although stress is not necessary, we will adopt the following convention for the sake of consistency:

        Each word should be stressed on the first vowel of the root.  If
        there is at least one vowel between the first root vowel and the
        penultimate (i.e., the next-to-last) vowel of the entire word, then
        the penultimate vowel should also receive stress.

The above provides almost all of the morphotactic system that I will be using throughout this monograph. (One additional feature will be introduced later in the chapter on [Anaphora](#S17_0).) The appendices contain a complete description of the morphology and a list of all of the morphemes that will be created and used in this monograph.

Note that with these word-formation rules, every morpheme and every word is unambiguously started and terminated. Thus, any word with this morphology can always be parsed unambiguously into its component morphemes, and a stream of words can always be divided unambiguously into individual words even if there are no spaces or pauses between words. In fact, even spaces or pauses **within** a word cannot confuse the parser. Thus, the boundaries between morphemes and words are never in doubt.

This feature of word morphology is usually called either *self-segregation* or *auto-isolation*.

As we will see later in [Appendix E](#APPENDIX_E), the syntax of the interlingua will also ensure self-segregation at the constituent and sentence levels. <span id="S2_5_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.5.2 Verb Design Examples

In the interlingua described in this monograph, each root will have a default argument structure associated with its classifier. (For a complete list of classifiers, refer to [Appendix C](#APPENDIX_C).) We can change the default by using a suffix that will indicate the new argument structure.

Here are the suffixes used to change the argument structure of a word (all of them create verbs by default):

        A/P/F-s:    -va A/P/F-d:    -vu
        A/P-s:  -vya    A/P-d:      -vyu
        AP/F-s: -ka AP/F-d:     -ku
        AP-s:   -kya    AP-d:       -kyu
        P/F-s:  -sa P/F-d:      -su
        P-s:    -sya    P-d:        -syu

The above suffixes should only be used if the default argument structure of the root is being changed. To change just the part-of-speech of a root without changing its default argument structure, use an appropriate part-of-speech suffix instead (see below).

Now, before proceeding, let's briefly review the semantics behind the notation we are using.

All verbs have a patient, whether stated or implied. If a verb has an agent, then the agent is responsible for the event described by the verb. If a verb has a focus, then the focus is the referent of a relationship with the patient. This referent can be either another entity, as in "John needs a pencil", or an elaboration of the event itself, as in "John told a joke".

A verb is either an agent-oriented action verb or a patient-oriented state verb. An action verb emphasizes what the agent is doing rather than what the patient is experiencing. A state verb emphasizes the ongoing or final state of the patient rather than how it came about or how the agent, if any, brought it about. An action verb **must** have an agent. A state verb may or may not have an agent. If an action verb has a focus, then the focus **must** elaborate the event.

For these examples, I'm going to start with an English verb, analyze it to determine its argument structure, and create a word for it in the interlingua. I will then try to create as many other verbs as possible from the **same** root by using different suffixes.

Let's start with the verb "to know", in the sense of 'having knowledge'. Typical sentences using this verb could be:

        He knows the answer.
               or
        He knows calculus.

Here, the subject is the patient and the object is the focus. The subject experiences a steady state of 'knowledgeable' focused on the object. Thus, this verb is a patient-oriented state verb and its argument structure is P/F-s.

Now, in the interlingua, the semi-root "kon" will represent the state concept that means 'knowing' or 'knowledgeable'. And since 'knowing' is inherently verbal and relational, it will be a P/F-s verb by default. In addition, the suffix "da" will set the part-of-speech of a root to verb. Thus, the word "konda" is the P/F-s verb meaning 'to know'.

Note that we **must** use the verb suffix "da", even though "kon" is verbal by nature, because the interlingua is self-segregating, and each word must be unambiguously terminated. Since a semi-root (such as "kon") is not a terminator, it must be followed by at least one suffix to properly terminate the word.

Note also that we are **not** using the P/F-s suffix "-sa", even though it is technically correct (i.e., it has the correct argument structure and part-of-speech). For the sake of consistency, we will only use an argument structure suffix to **change** an argument structure. And since the default argument structure of "kon" is already P/F-s, all we need to do is set the part-of-speech to verb, which we can accomplish with the suffix "da".

Next, let's take the same root and see what happens when we apply different argument structure suffixes to it. We will deal first with focused verbs, since the concept of 'knowing' is inherently focused:

        A/P/F-s:    "konva" = 'to keep (someone else) current in (something)'
                    Agent maintains patient's knowledge.
                    e.g. He keeps them up-to-date on company procedures.

        A/P/F-d:    "konvu" = 'to inform/enlighten (someone) about
                            (something)'
                    Agent causes patient to gain knowledge.
                    e.g. He informed us about the meeting.

        AP/F-s:     "konka" = 'to keep track of', 'to keep up on', 'to
                            keep informed about', 'to keep oneself current
                            or up-to-date on (something)', 'to monitor'
                    Patient maintains his knowledge.
                    e.g. He kept track of the student activities.

        AP/F-d:     "konku" = 'to learn (something)', 'to determine/
                            ascertain/learn that (event)', 'to find out'
                    Patient causes himself to gain knowledge.
                    e.g. He determined that the butler did it.
                         He learned the rules.

        P/F-s:      "konda" = 'to know', 'to understand', 'to realize'
                    Patient is knowledgeable.
                    e.g. He knows the rules of the game.

        P/F-d:      "konsu" = 'to learn', 'to realize', 'to discover',
                                    'to find out', 'to come to know'
                    Patient gains knowledge.
                    e.g. He learned the rules by watching the others.

Keep in mind that the above English glosses are approximations, and that the real meaning should be determined from the root plus its argument structure. With the precisely defined semantics used above, there is no doubt. Also, keep in mind that the paraphrases cannot capture the **immediacy** of the involvement of the participants. This immediacy can only be represented by the single word - **not** by the paraphrase. For example, a paraphrase of the verb "to kill" is 'to cause to die', even though the two are not synonymous. The paraphrase is simply the closest we can get to the true meaning using multiple words. Please keep this in mind, since we will be using paraphrases throughout this monograph.

Note that all of the above derivations are focused. Focused derivations are the most useful simply because the concept 'knowing' is most often applied this way. But the unfocused derivations are also very useful, as we'll see later when we discuss [Grammatical Voice](#S2_7) . Before we can discuss these differences, though, we need to acquire a little more background in verbal semantics. <span id="S2_5_3"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.5.3 From Basic Verb to Noun

The semantics of a verb that is converted to a noun will be as follows:

        When converting a basic verb to a noun, the noun will
        represent a PROTOTYPICAL GENERIC SUBJECT of an event
        indicated by the verb.

Now, in the interlingua, we will use the suffix "-di" to change the part-of-speech of a word to 'noun' without changing its argument structure. For example, the noun form of the P/F-s verb "konda" is simply "kondi". If the argument structure must also be changed, then an argument structure suffix **and** a part-of-speech suffix will be needed.

Here are some examples:

        P/F-s:   "kondi"   =  'knower', 'the cognizant one', 'the one
                                  in the know'
        P/F-d:   "konsudi" =  'learner'
        A/P/F-d: "konvudi" =  'informer'

<span id="S2_5_4"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.5.4 From Basic Verb to Adjective

The semantics of verbs that are converted to adjectives will be as follows:

        When converting a basic verb to an adjective, the adjective
        will represent the prototypical QUALITIES of a generic
        subject, expressed attributively.  This meaning can be best
        paraphrased as "having the attributes of one who VERBs or of
        something which VERBs".

In the interlingua, the suffix "-do" will indicate that the part-of-speech of a word is 'adjective'. Here are some sample derivations from the root "kon":

        P/F-s: "kondo" = 'knowing', 'cognizant', 'aware', 'in the know'

        A/P/F-d: "konvudo" = 'having the attributes of one who informs
            or enlightens' = 'informing/enlightening'. (Literally:
            'having the attributes of one who causes others to
            increase in knowledge about something'.)

        AP/F-d: "konkudo" = 'learning/determining'

It is important to note that the use of present participles (e.g. "informing") to represent the actual meanings is somewhat misleading, because English participles have strong implications of tense and aspect. For non-participial renderings, this is not a problem as in "the man in the know". Also, for similar reasons, do not confuse adjectives with relative clauses. For example, a "learning geologist" is not quite the same as a "geologist who is learning" since the relative clause **definitely** specifies tense and aspect, whereas "learning geologist" could also be used if the learning occurred in the past or future. <span id="S2_5_5"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.5.5 From Basic Verb to Adverb and Case Tag

To continue along the same lines as above, we will use "-de" to indicate that the part-of-speech of a word is 'adverb'. However, before we can put this to use, we must first digress for a while and discuss the semantics of case tags and adverbs. <span id="S2_5_5_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.5.5.1 From Basic Verb to Verbal Modifiers

In this section, I would like to discuss the semantics of adverbs (especially those that correspond to English adverbs that end in "-ly") and most case tags (such as English prepositions, Japanese post-positions, Hungarian case inflections, etc.), and I will try to show how verbs can be converted to adverbs and case tags. The final result will be a system that can replace many complex, idiosyncratic and periphrastic constructions of natural languages with constructions that are syntactically simple and semantically transparent. <span id="S2_5_5_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.5.5.2 Semantics of Case Tags and Related Adverbs

First, let me illustrate how verbs can, in fact, represent the semantics of English prepositions, adverbs, and particles by giving examples from other languages. In these languages, some verbs are actually used in the same way as English prepositions, adverbs, and particles. Consider the following from Vietnamese:

       (1)  Toi   di   lai   nha bang.
            I     go   to    bank
            I'm going to the bank.

       (3)  Nha bang   o   Hanoi...
            bank       in  Hanoi
            The bank in Hanoi...

In the first example, the word "lai" is actually the verb 'to come'. When used transitively, it takes a destination as a direct object (like the English verb 'to enter'). In the second example, the word "o" is actually the verb 'to be located at' and takes a location as a direct object. (Thus, the second example could also stand alone as a complete sentence meaning 'The bank **is in** Hanoi'.) Many other languages, such as Igbo, Ewe, Twi, and Yoruba (Niger-Congo languages of west Africa), Indonesian, Chinese, Cambodian, and many pidgins and creoles have similar constructions. Also, these constructions are not limited to locatives. In Chinese, for example, the word "yung" is the verb meaning 'to use'. It is also the preposition meaning instrumental 'with', as in the sentence "He broke the window **with** a hammer".

It's also possible to create adverbs, particles, and completely new verbs in this manner. In Hindi, for example, "to run go" means 'to run away', and "to cook take" means 'to cook for oneself'. In Yoruba, "to carry come" means 'to bring', and "to carry go" means 'to take away'.

Linguists have a name for this type of construction, in which two or more verbs are linked without the use of coordinating conjunctions or subordinators. They are called *serial verbs*.

There are two major types of serial verb constructions: the events indicated by the verbs are either simultaneous or consecutive. In this discussion, we are only interested in the first category, where the two verbs represent events that occur simultaneously.

Other useful serial verb constructions are those in which two or more verbs are linked, all taking the same subject and object. In these cases, the lack of a conjunction or subordinator often implies a certain 'immediacy'; i.e., that the event is a single entity, rather than a combination of unrelated or sequential events. Some languages, such as Chinese and Yoruba, allow any combinations that make semantic sense, and even allow noun phrases to split the verbs, creating an effect similar to relative clauses, but where the events indicated by the verbs are often much more tightly linked. Note that these types of constructions are not idiomatic - they are actually quite productive and their meanings are predictable from syntax and context. What most serial verb constructions have in common is that they are taken by speakers as representing parts of the same event.

English has a few verbs that can be used in this way, such as "to go visit", "to come play", "to let go", "to stir-fry", and "to test-fly" but note that the first two represent consecutive events, which is not what we are interested in here. Most of the time, English uses participles to achieve a simultaneous effect. Here are some examples, where the first sentence of each triplet indicates simultaneity:

            The child ran screaming to his mother.
        vs. The child who ran to his mother was screaming.
        vs. The child who was screaming ran to his mother.

            The man woke up shivering.
        vs. The man who woke up was shivering.
        vs. The man who was shivering woke up.

            The boy stumbled, knocking over several chairs.
        vs. The boy who stumbled knocked over several chairs.
        vs. The boy who knocked over several chairs stumbled.

            The girl slept, dreaming of unicorns.
        vs. The girl who slept dreamt of unicorns.
        vs. The girl who dreamt of unicorns slept.

What is happening here is that the participial phrase is more closely linked to the verb rather than to the noun it ostensibly modifies. As a result, we can create what are essentially compound verbs without subjects, and the results make perfectly good sense:

        to run screaming
        to wake shivering
        to stumble knocking over several chairs
        to sleep dreaming of unicorns

In effect, the words "screaming" and "shivering" behave exactly like adverbs, and the words "knocking over" and "dreaming of" behave exactly like case tags (i.e. English prepositions) that introduce phrases that modify the verb.

Thus, we should be able to create adverbs and case tags from verbs by applying the same semantic logic. Here's are some examples:

        I broke the window using a hammer.
        I broke the window with a hammer.
            to use: A/P-s

        The kids ran, crossing the road.
        The kids ran across the road.
            to cross: AP/F-d

        They came, tagging along (i.e. accompanying an unspecified
            focus).
        They came along.
            to tag along: AP-s

        The army positioned itself, surrounding/encircling the town.
        The army positioned itself around the town.
            to surround: AP/F-d or P/F-s or AP/F-s

        The car moved slowly, backing up.
        The car moved slowly backwards.
            to back up: P-d

        He visited his parents, staying three days.
        He visited his parents for three days.
            to stay: P-s or AP-s

Additionally, if English had a verb like Vietnamese "o", Chinese "zai", Cambodian "niw", or Hausa "yana" (all of which mean 'to be located at or in'), we could create the locative senses of the prepositions "in" and "at" from it. For example, if the English word "bain" meant 'to be located in/at', we would have:

        The children were playing, baining the backyard.
        The children were playing in the backyard.
            to bain: P/F-s

In summary, speakers of languages with serial verb constructions effectively make up new 'prepositions' as they are needed. If a preposition with a desired literal meaning is not available, English speakers will either use existing prepositions metaphorically, or will use participial constructions as illustrated above. In this monograph, we will implement a system that has the flexibility of the serial verb constructions (but which is semantically and morphologically precise), and thus avoid the need for potentially untranslatable metaphor. <span id="S2_5_5_3"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.5.5.3 Designing Case Tags and Related Adverbs

As an example of the adverb/case tag creation process, let's continue where we left off when we started this digression, and create a set of adverbs and case tags from the state concept of 'knowledgeable'. As mentioned earlier, we will use the part-of-speech suffix "-de" to mark the part-of-speech. Those whose verb forms do **not** take objects (i.e. intransitive verbs) will become adverbs, and those which **do** take objects (i.e. transitive verbs) will become case tags (i.e. English prepositions) adding a new oblique argument to the main verb. Thus, in effect, the case tag will **link** its argument to the verb. In the following examples, I will use English for all words except the new case tag/adverb. I will also use English word order. Here are the results:

        A/P/F-s: "konvade" = 'keeping (someone else) current in'
            e.g. The company spends a lot of money konvade its employees
                    the latest technology.
            [Note that "konvade" has two objects.  Thus, there is no need
            for the preposition "in".]

        A/P/F-d: "konvude" = 'informing (someone) about (something)'
            e.g. The policeman stood in front of the room konvude us
                    the robbery.

        AP/F-s: "konkade" = 'reviewing', 'keeping oneself current in'
            e.g. They spent the night at John's house konkade the lessons
                    for the next day's exam.

        AP/F-d: "konkude" = 'learning about (something)'
            e.g. He spent three years konkude the conspiracy.

        P/F-s: "konde" = 'knowing (something)'
            e.g. Joe quietly left the room konde he would be called on
                    next.

        P/F-d: "konsude" = 'learning (something)', 'coming to know'
            e.g. He watched their activity for three hours konsude valuable
                    information.

In all cases, note how the derived case tag modifies the whole sentence, just as if it were an oblique argument of the main verb. Note also that the case tag is tightly bound to the subject of the main verb. For example, in the sentence:

        Joe quietly left the room konde (= 'knowing') he would be
            called on next.

the subject of the case tag "konde" is P and links to the subject of the main verb "to leave" which itself is AP/F-d. Thus, the effective subject of the case tag "konde" is "Joe". And in the sentence:

        The policeman stood in front of the room konvude (= 'informing')
            us the robbery.

the subject of the case tag "konvude" links to the subject of the main verb "to stand" which is AP-s. Thus, the effective subject of the case tag "konvude" is "the policeman".

\[Incidentally, note that "konvude" is A/P/F-d and must be followed by TWO arguments, "us" and "the robbery". No preposition can appear between them. The English translation, however, requires the preposition "about" or "of" to precede the focus of the verb "inform".\]

In this section, we discussed how to convert existing verbs into adverbs and case tags. [Later](#S4_0), we will discuss how to systematically create the many case tags required by a language, such as those needed to represent English prepositions. <span id="S2_6"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.6 Generic State and Action Verbs

All of the morphemes that change the default argument structure of a word represent concepts that are useful in their own right; i.e., they can be used to create useful generic verbs if they are applied to an appropriate generic state or action concept. <span id="S2_6_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.6.1 Generic State Derivations

In the interlingua, we will use the semi-root "tu" to represent a generic relational state, with the vague meaning 'having an unspecified relationship with', 'having something to do with', and so on. Note that this is the 'other' classifier for the scalar relational state group. Thus, it is the most general classifier for relational states. \[See [Appendix C](#APPENDIX_C) for a complete list of classifiers in the interlingua\]. <span id="tuda"></span>

Now, since "tu" represents the most generic relationship possible, the P/F-s verb form "tuda" will indicate that a relationship exists between patient and focus, but will imply nothing about the nature of the relationship. Thus, its meaning can be paraphrased as 'to have an unspecified relationship with' or 'to have something to do with'.

Here are a few other derivations using "tu":

        P/F-s: tudo - 'associated', 'related', 'corresponding'

        A/P/F-s: tuva - 'to keep P involved with', 'to have P stay
                involved with',

        A/P/F-d: tuvu - 'to cause P to become associated or
                involved with F'

        AP/F-s: tuka - 'to keep oneself in an unspecified steady state
                with respect to', 'to stick with', 'to remain
                associated with', 'to continue one's relationship
                with'
           e.g. He stuck with the project.

        AP/F-d: tuku - 'to get oneself involved with', 'to take on'
           e.g. He took on the project three years ago.

        AP-s: tukya - 'to keep onself in an unspecified steady state with
           respect to something generic or known from context', 'to
           persevere', 'to remain steadfast'
           e.g. He remained steadfast/persevered until the end.

        P/F-d: tusu - 'to become involved with', 'to become associated
                with', 'to come to have something to do with'
           e.g. He got involved with the project against his will.

<span id="S2_6_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.6.2 Generic Action Derivations

Now, we can also derive generic **action** verbs using the generic action classifier "gu". By default, "gu" is an A/P-d semi-root. Note that "gu" is the 'other' classifier for the action classifier group making it the most general member of the group.

Keep in mind that action verbs emphasize what the agent is doing rather than what the patient is experiencing, and that the focus of a focused action **always** elaborates the event itself.

Here are some of the more useful derivations using "gu":

        A/P-d: guda - 'to do something to', 'to act (up)on'
           e.g. Billy did something to the cat.

        AP/F-s: guka - 'to do/make/perform/carry out (something)', 'to
                        keep oneself busy/occupied with (something)'
           e.g. He is doing his homework.
                We made three trips to New York.

        AP-s: gukya - 'to act', 'to behave'
           e.g. I don't like the way you acted/behaved yesterday.

        AP/F-d: guku - 'to accomplish/achieve'
           e.g. We accomplished the task.

        A/P-s: guvya - 'to run/control/operate/manage/(make) use (of)'
           e.g. John ran/managed the company for three years.
                He operated/ran the new lathe.
            Why did you use my telephone?

As we will see [later](#S2_7_6), many of the above generic verbs can undergo additional derivations to produce some very useful words.

Since actions always imply agents, non-agentive derivations will not be very useful. <span id="S2_7"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.7 Grammatical Voice

So far, we've only talked about verbs in the active voice; i.e., where all of the arguments of a verb are present and appear in the proper order. For example, the A/P-d verb "to break" has an agent subject and a patient direct object. However, natural languages have many ways of changing the relative importance or topicality of a verb's arguments. Languages can also remove arguments from the argument structure, while implying that they still exist, and make the missing arguments either obliquely expressable or not expressable at all. Finally, languages can also incorporate normally oblique arguments, making them part of the argument structure of the verb. For example, consider the following:

        John broke the window.
        = active voice

        The window was broken.
        = passive voice, implied agent

        The window was broken by John.
        = passive voice, oblique agent

        The window was broken with a hammer.
        = passive voice, oblique instrument, implied agent

        A hammer broke the window.
        = incorporated instrument, agent cannot be expressed at all
          (*by John), new structure is something like I/P-d, where I =
          instrument.

        The window broke accidentally.
        = middle voice, implied agent, agent cannot be expressed at
          all (*by John).

        The window broke.
        = P-d verb.  This is sometimes confused with middle voice.  In
          the system described in this monograph, this verb is a basic
          verb and the example is in the active voice.  No agent is
          expressed or implied.

        John broke something.
        = anti-passive (this is an approximation - English does not have
          a true morphological anti-passive construction).  The agent
          alone is prominent.  The patient loses its prominence but may
          be expressed obliquely.  However, even when not expressed
          obliquely, a patient is always implied.

        The window broke John.  (poetic license needed here) or
        The window, John broke it.
        = inverse voice (again, these are approximations - English does
          not have a regular inverse construction).  Patient becomes
          subject, agent becomes object and MUST appear.

Different languages handle these distinctions in different ways. As you can see from the above examples, English uses combinations of syntax, morphology, periphrasis, and even poetic license. Other languages are more regular, some using inflections for some voices, while others may use derivations or a combination of both. In addition, some languages allow the incorporation of other case roles into the argument structure of a verb. In fact, the number of possible voice variations among the world's languages is quite large.

Since grammatical voice has different meanings to different people (with middle voice being the most confused/confusing), let me precisely define the meaning that I am using here. Specifically,

> A grammatical voice change starts with a basic verb and rearranges the argument structure by increasing or reducing the topicality of one core argument relative to another, but without changing the basic meaning of the verb. In the process, an existing argument may be deleted. A deleted argument may be expressed obliquely (e.g. passive) or may not be expressable at all (e.g. middle). However, the role of the deleted argument is ALWAYS implied.

Thus, even though the original subject may not be expressed in a middle voice construction, it is still implied. For example, in "Mice kill easily", someone or something is responsible for the killing even though it cannot be expressed. In "Mice die easily", no agent is expressed or implied. Thus, the former is an example of a grammatical voice change, while the latter is not.

An argument that increases in relative topicality is said to be *promoted*, and an argument that decreases in relative topicality is said to be *demoted*. Demoted arguments continue to play their original semantic roles, but are somehow less important or less involved. The following examples illustrate this effect:

        Active:       The enemy bombed the city.
        Passive:      The city was bombed.               <- no agent
                   or The city was bombed by the enemy.  <- oblique agent

        Active:       She sewed the dress.
        Anti-passive: She sewed something.               <- no patient
                   or She did the sewing on the dress.   <- oblique patient

Although the number of possible voice combinations is large, there are a few that crop up often among the world's languages. Here are the most common ones:

        Active - transitive: The subject is slightly more important or
            topical than the object.  Both must be expressed.  This is by
            far the most common form used in almost all languages.

            [The only exceptions I know of are Fijian and the Salish
            languages of northwestern North America.  In these languages,
            all transitive verbs are derived by addition of an affix to the
            intransitive form.  Also, in Fijian, the most commonly used verb
            form is active INTRANSITIVE.]

        Passive: The original object becomes the subject and becomes
            considerably more topical than the original subject.  The
            original subject is no longer part of the verb's argument
            structure, and does not have to be expressed.  However, it is
            always implied and may be expressed obliquely (in English,
            typically using the preposition "by").

        Middle: The original object is made more topical and becomes the
            subject.  The original subject is deleted from the verb's
            argument structure and may not be expressed at all even though
            it is implied.

        Anti-passive: The subject is made considerably more salient than
            the object.  The original object is no longer part of the verb's
            argument structure, and does not have to be expressed.  However,
            it is always implied and may be expressed obliquely.

        Inverse: The arguments of the active verb are simply reversed.  The
            original object becomes the subject, gaining in importance; and
            the original subject becomes the object, losing importance.
            Unlike passive, the original subject is not oblique and MUST
            appear.

Keep in mind that the above are generalizations. Individual languages vary both in the ways that the various voices are implemented as well as in their semantics. Also, keep in mind that the list contains just the most common voice systems. Many other combinations are possible, especially those involving normally oblique case roles.

As we saw above, a language like English, which does not have this ability, must resort to complex and idiosyncratic constructions to achieve the same effect. Always keep in mind, though, that a voice change simply re-arranges the topicality of some of the participants in a sentence. Our goal should be to achieve the same results in a consistent and easy-to-understand manner.

Also, English rarely uses the same strategies to handle these needs. For example, an effect similar to the passive and anti-passive can be achieved by using impersonal constructions: "Johnson punched someone" (anti-passive) or "Someone is at the door" (passive). An effect similar to the inverse can often be accomplished by fronting or left dislocation, as in "(As for) the car, John wrecked it". However, true inverse effects can sometimes be obtained by periphrasis, as in:

        Active:  The cup is full of water.
        Inverse: Water fills the cup.

Finally, inverse and middle effects are sometimes achieved in English by using completely different root morphemes, as in "I enjoyed the show" vs. "The show pleased me" (inverse), or by use of metaphor or idiom, as in "He remembered the answer" vs. "The answer came to mind" (middle).

\[Incidentally, the inverse voice comes in two varieties. In the first, which is sometimes called a *semantic inverse*, an inverse operation may be required in order to properly assign case roles to the arguments of a verb. Semantic inverse constructions are especially common in the native languages of North America. For example, in Plains Cree (Algonquian), a more animate argument is inherently more topical than a less animate argument, and neither word order nor case marking of nouns can change the interpretation. Thus, if "man" and "dog" appear as the main arguments of the verb "bite", then it will always be interpreted as "man bites dog", regardless of word order. An inverse marking on the verb simply reverses the relative topicality, making "dog" more topical than "man", and is **required** to obtain the sense "dog bites man". I do not consider this usage a true voice alteration. It is simply an uncommon way of marking semantic case roles in a sentence. Similarly, some Sino-Tibetan languages have an inverse voice based on the relative topicality of 1st, 2nd, and 3rd person, rather than animacy. Note though, that although an inverse operation may at times be required, it can also be used when it is not required in order to achieve the changes in topicality that we are describing here. In these cases, such an operation is called a *pragmatic inverse*.

True pragmatic inverses can be found in languages such as Maasai (Nilo-Saharan), Sahaptian languages (Penutian, western North America; e.g. Nez Perce), Caucasian languages (e.g. Georgian), and Chamorro (Austronesian, Guam). (In fact, Maasai and Sahaptian languages have both semantic **and** pragmatic inverses.) Finally, a combination of word order changes and direct case marking of nouns can sometimes be used to achieve an inverse effect (e.g. Korean). However, other languages which have this ability (e.g. Russian) frequently use it for quite different purposes. As for true inverse systems, recent research indicates that such systems are actually much more common among the world's languages than had been previously supposed.\] <span id="S2_7_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.7.1 Implementation of a Grammatical Voice System

Most European languages (including English) use cumbersome rules involving auxiliaries, participles, reflexives, context, word-order, and even complete lexical changes to indicate voice. More heavily inflected languages (Arabic, Latin, Japanese, Ainu, etc.) use the very simple expedient of inflecting the verb for most indications of voice. Many South American lowland languages and some isolating (i.e. uninflected) languages such as Chinese and Vietnamese do not have a formal morphology or syntax to cover voice, although they can achieve similar effects via explicit topicalization and/or periphrasis.

Finally, other languages such as the Bantu languages of Africa (e.g. Swahili) and Austronesian languages (e.g. Indonesian) use derivational morphemes (which is essentially what we are doing here) to achieve most voice effects. In other words, they create a completely different verb from the same root as the active verb, but the new verb has a different topicalization and argument structure.

So, how should an MT interlingua implement grammatical voice? Ideally, we would like to create a system that can handle any voicing needs, while being both simple and consistent.

I do not feel that grammatical voice change should be implemented in syntax - syntax is not nearly as flexible as morphology. Instead, grammatical voice changes can be best implemented using derivational morphology. In other words, we will allocate a single suffix for each voice. The resulting verbs will, of course, have a different argument structure.

For the interlingua, we will allocate the following suffixes for these voice morphemes:

        Middle voice:           -so
        Passive voice:          -vo
        Anti-passive voice:     -voy
        Inverse voice:          -kwe

Voice suffixes do **not** change an existing part-of-speech.

For example, if the state root meaning 'open/unshut/unblocked' is "canzan" (default = P-s), then the word for the A/P-d verb 'to open/unshut' is simply "canzanvyu". We can implement the other voices as follows:

        middle: canzanvyuso
            e.g. The window canzanvyuso easily
                 = The window opened easily.

       passive: canzanvyuvo
            e.g. The window canzanvyuvo (by the thief)
                 = The window was opened (by the thief).

       anti-passive: canzanvyuvoy
            e.g. The thief canzanvyuvoy (of the window)
                 = The thief did the opening (of the window) or
                 = The thief was the opener (of the window) or
                 = The thief opened something.
                 [The third gloss applies only if the argument is not
                 expressed obliquely.]

       inverse: canzanvyukwe
            e.g. The window canzanvyukwe the thief
                 = The window - the thief opened it.

where optional oblique arguments are shown in parentheses.

In the above examples, the inverse paraphrase is only approximate, and actually increases the topicality of the fronted item more than it should. A better example of a true inverse effect in English would be:

        Active:         John owns the book.
        Inverse:        The book belongs to John.

where "to belong to" should be thought of as a single complex verb (rather than as a verb plus the case marker "to"). Note that the second sentence is a true inverse of the first, and is only roughly approximated by the paraphrase "The book - John owns it".

A useful notational scheme will be to put an implied case role in square brackets, with a plus "+" or minus "-" sign to indicate whether it can be expressed obliquely. Thus,

        middle:       changes A/P-x  to P-x [-A]
                              AP/F-x to F-x [-AP]
                              P/F-x  to F-x [-P]

        passive:      changes A/P-x  to P-x [+A]
                              AP/F-x to F-x [+AP]
                              P/F-x  to F-x [+P]

        anti-passive: changes A/P-x  to A-x  [+P]
                              AP/F-x to AP-x [+F]
                              P/F-x  to P-x  [+F]

        inverse:      changes A/P-x  to P/A-x
                              AP/F-x to F/AP-x
                              P/F-x  to F/P-x

where "-x" represents either "-s" or "-d".

For verbs that take three arguments, we will do the following:

        middle: changes A/P/F-x to P/F-x [-A]
            e.g. *The students taught French easily.
                 [This is ungrammatical in English with the intended
                 meaning, but grammatical in the interlingua.]

        passive: changes A/P/F-x to P/F-x [+A]
            e.g. The students were taught French (by Mr. Johnson).

        anti-passive: changes A/P/F-x to A/F-x [+P]
            e.g. He shouted obscenities (at the crowd).
             [Note that the English verb "to shout" is inherently
             anti-passive.  Thus, we must start by creating an
             A/P/F-d version of this verb, and then perform an
             anti-passive operation to derive an exact equivalent of
             the English verb "to shout".]

        inverse: changes A/P/F-x to P/A/F-x
            e.g. The student - John taught him geometry.

In addition, some languages, such as Latin, Shona (Bantu), Turkish, Classical Greek, and German allow *impersonal passives*, in which an intransitive verb is passivized becoming a zero-argument verb. For example, the AP-s verb "to run" could undergo a passive or middle transformation into 0-s \[+AP\] or 0-s \[-AP\], depending on the language, where "0" is used to indicate that the verb has no arguments. It is interpreted as something like 'running took place' or 'there was running'. A verb like P-d "to grow" could become 0-d \[+/-P\], and would mean something like 'growing took place' or 'there was growth'. The interlingua allows all of these variations.

Another useful derivation would be to take an A/P/F verb and reduce the topicality of the **third** argument. (Remember, the anti-passive discussed above reduces the topicality of the **second** argument.) We will refer to this as an anti-anti-passive operation. However, I know of no natural language that has a distinct way of marking such an operation, so we will not do so in the interlingua. Instead, we can achieve the same effect by simply changing the argument structure of the word using an A/P suffix. We'll see examples of how to do this later.

As we saw with the verb meaning 'to shout (at)', grammatical voice alterations are useful for creating speech act verbs which never take a patient as a direct object, such as the A/F-s \[+P\] verb "to dictate", as in "He dictated the letter (to his aide)". For verbs like these, we can create a verb that **does** allow a direct object patient, and promote a focus to first object by means of the anti-passive alteration. <span id="S2_7_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.7.2 More on Middle Voice

The passive, anti-passive, and inverse voices are easy to understand, and I'll say no more about them. Middle voice, however, is so frequently confused with basic intransitivity that I'd like to say a little more about it.

English does not have a formal morphosyntax for middle constructions, unlike many other languages (Persian, Swahili, Basque, Somali, Hausa, Turkish, and many, many others - middle forms in these languages often go by other names, such as statives or agentless passives, but they often function semantically as middles). English does not even have a reflexive clitic construction, as do several other European languages, which often performs additional duty for middle voice. This is unfortunate, since, as we will see, it can be extremely useful and productive.

English **sometimes** allows an active verb to be used without modification in a middle construction, as long as the context forbids an active interpretation. Thus, we can say "The joke did not translate well", or "The plane landed ten minutes ago", or "The library closed early". But even when the meaning is clear, English can be quite idiosyncratic as in "\*The mountains see in the distance" or "\*The boxes are covering in the storeroom". Sometimes, if the verb has an agent, an indefinite construction can be used, as in "They don't make cars like they used to". And in cases where context and semantics do not make it clear, English is often forced to use periphrastic constructions, completely different words, metaphors, and even idioms. Consider the following examples:

               ACTIVE                       MIDDLE
        I see the mountains.        *The mountains see.
                                    The mountains are in view.
            Thus, from the verb "to see", P/F-s, we can derive:
                    "to be in view", F-s [-P]

        The gang terrorized the     *The neighborhood terrorized for three
        neighborhood for three      years.
        years.
                                    The neighborhood lived in a state of
                                    of terror for three years.

            Thus, from the verb "to terrorize", A/P-s, we can derive:
                    "to live in a state of terror", P-s [-A]

        That woman buys caviar only         *Caviar buys only when it's on sale.
        when it's on sale.                  Caviar sells only when it's on sale.

            Thus, from the verb "to buy", AP/F-d, we can derive:
                    "to sell (intransitive sense only)", F-d [-AP]

        He threw the rock at the window.    *The rock threw at the window.
                                            The rock went flying at the window.
            Thus, from the verb "to throw", A/P-d, we can derive:
                    "to go flying (metaphorically)", P-d [-A]

        I remembered her face.      *Her face remembered.
                                    Her face came to mind.

            Thus, from the verb "to remember", P/F-d, we can derive:
                    "to come to mind", F-d [-P]

        He swallowed the pills      *The pills swallowed with difficulty.
                with difficulty.    The pills went down with difficulty.

            Thus, from the verb "to swallow", A/P-d, we can derive:
                    "to go down", P-d [-A]

And so forth. The number of possible examples is almost unlimited. Thus, English **can** deal with middle concepts, although the forms are usually highly irregular, unpredictable, periphrastic, and often either metaphoric or idiomatic.

Some English verbs that can be used both transitively and intransitively, such as "open", "cook", and "fill", have gerund forms that refer to the state of the **object** rather than the subject. For example, "the opening door" means 'the door that is being opened', **not** 'the door that is doing the opening'. In these cases, the English gerund is equivalent to the interlingua's middle form. For example, the adjective "canzanvyudo" means 'doing the opening' while "canzanvyusodo" means simply 'opening' as in "the opening door". Also, "canzanvyusodo" implies that someone or something is causing the door to open; i.e., an agent. If no agent is implied, then the P-d form "canzansyudo" should be used instead. \[Note that the suffix "-do" is needed in all three cases to convert the result to an adjective. Keep in mind that the argument structure suffixes, such as "-vyu", create verbs by default, while the voice suffixes, such as "-so", do not change the part-of-speech.\]

Middle verbs are often confused with basic P-s or P-d state verbs. The reason is that the patient is the subject of an intransitive verb, and it is often uncertain whether or not a transitive subject is implied. In languages which have a formal middle voice, however, there is never any doubt. Unfortunately, speakers of languages like English will have to be a little more careful. When in doubt, the basic P-s or P-d form should always be used instead of the middle form unless a transitive subject is clearly implied. Middle verbs are also often confused with reciprocals and reflexives because some languages (especially European languages) use the same forms for more than one voice. In the semantic system used by the interlingua being discussed here, middles, reflexives, and reciprocals are completely different. \[We will discuss [reflexives](#reflexive) and [reciprocals](#reciprocal) later.\]

It's important to keep in mind the difference in semantics between middle and passive derivations (including anti-middle and anti-passive). A middle derivation is used when the demoted argument **cannot** be specified, which is always the case in generic situations and when the demoted argument is known from general knowledge (e.g. "Mice kill easily"), as well as when the demoted argument is generic in the current context (e.g. "The mountains finally came into view"). However, a passive derivation **without** an oblique argument implies that the speaker is intentionally omitting some information that is not known to the listener, most likely because the speaker does not consider the actual argument to be very important, or perhaps because the speaker does not know it himself. A passive derivation **with** an oblique argument implies that the speaker considers the argument to be less important than the non-oblique arguments.

For example, compare "The library closed at 6 o'clock" (middle) with "The library was closed at 6 o'clock" (passive). The middle construction gives the impression that the closure was normal, while the passive construction implies that the closure was unusual and that unknown information was omitted, as in "The library was closed at 6 o'clock by the mayor because of the emergency".\]

Thus, the middle and passive derivations represent three distinct degrees of relevance:

        Middle:
            Argument cannot be specified because it is too general,
            is common knowledge, or is generic in the current context.
            Specifying it would be redundant or excessively verbose.

        Passive without oblique:
            Argument is not specified because the speaker does not
            consider it important or does not know it.

        Passive with oblique:
            Argument is provided but is less important than would
            otherwise be implied if it were not oblique.

As usual, though, language is rarely so precise and there will be some overlap. In other words, a speaker can at times use a middle derivation when a passive one would be more technically correct, or vice-versa.

Finally, since the middle voice makes the subject generic, the noun version of a middle voice alteration has the meaning of a prototypical, generic object of the unmodified verb. This allows us to create many new and useful words. Here is an example using a root we already know:

        "konda" = 'to know' -> "konsodi" = 'datum', 'fact',
                                   'item of knowledge'

Compare the above with the passive form "konvodi", which would have the meaning 'something which is known'. With the passive form, the original subject (i.e. the "knower") still has a strong presence. In the middle form, however, the original subject is almost completely eliminated. <span id="S2_7_3"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.7.3 Incorporating Oblique Case Roles

Some natural languages can make almost any case role a subject or object of the verb (e.g. Malagasy, some Mayan languages, and most Philippine languages). In fact, among the Philippine languages, verbs almost always have an explicit morpheme that indicates the case role of the subject, and almost any case role can be promoted to subject. Many Bantu languages of Africa (e.g. Swahili) and some Australian languages (e.g. Dyirbal) allow an instrumental case role to be promoted to object. Many Bantu languages also allow a locative case role to be promoted to subject. Indonesian allows a beneficiary case role to be promoted to object. And so on.

Obviously, the above system could be easily extended to add normally oblique case roles to the argument structure of a verb. However, we will **not** be doing this in the interlingua for the following reasons:

> 1\. It is extremely rare among natural languages.
>
> 2\. The number of possible combinations of argument position and case role is very large, and would require a large number of special morphemes that would rarely be used.
>
> 3\. Most (all?) languages that allow promotion of normally oblique case roles have special reasons for doing so. For example, many languages allow relativization of only certain core arguments, and thus a voice change is **required** before other arguments can be relativized.
>
> 4\. If the syntax of the interlingua is designed properly, then **any** argument can be promoted or demoted by simply changing its position relative to the other arguments. For example, consider the following, greatly simplified VSO syntax:
>
>
>         sentence ::= verb { argument }
>
>         argument ::= core_argument | oblique_argument
>
>         core_argument ::= noun_phrase
>
>         oblique_argument ::= case_tag ( noun_phrase )
>
>         [A case tag that is not followed by a noun phrase is an
>         adverb.]
>       
>
> The above syntax allows oblique arguments to be placed after, between, or even before the core arguments, which can have the same effect as explicit, morphological promotion or demotion. For example, if we need to promote an instrumental case role, we can do something like this: "Broke with a hammer John the window" or "Broke John with a hammer the window". Note though, that we **do** need to modify the verb itself if we need to promote or demote a core argument.

For all of the above reasons, there is no need to implement grammatical voice changes that would promote normally oblique case roles to core positions. Thus, while there **must** be a way to modify the relative topicalities of core arguments, there is simply no need to create special morphemes to promote normally oblique arguments.

Incidentally, core arguments are not limited to noun phrases. They can also be embedded sentences. Here are some examples:

        John wanted the book   vs.  John wanted Bill to leave.
        I saw the mountains    vs.  I saw them working.
        They liked her         vs.  They liked her portrayal of Juliet.
        We know the answer     vs.  We know that he likes her.

A sentence which appears as the argument of a verb is called a *complement*.

Note that the English embedded sentences are idiosyncratic in that they require either infinitives, participles, nominalizations, or complete finite sentences, depending on the particular verb. By using an embedded sentence with the same form as a normal sentence (i.e. a complete finite sentence), you can achieve the same effect with a simpler morphology and syntax. Here is how the above examples would look (the complete embedded sentence is in parentheses):

        John wanted (Bill leave).
        I saw (they were working).
        They liked (she portrayed Juliet).
        We know (he wants (she buy the car)).

They seem awkward in English, but they're linguistically sound, syntactically simpler, and totally lacking in idiosyncracy. Also, this approach is used in **many** natural languages.

\[Incidentally, a complete description of the syntax of the interlingua has been provided in [Appendix E](#APPENDIX_E) of this monograph.\] <span id="S2_7_4"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.7.4 Summary of Grammatical Voice Nomenclature

There are two voice changing operations that demote an argument: passive and middle. A passive voice change demotes an argument but allows it to be expressed obliquely. A middle voice change demotes an argument but does **not** allow it to be expressed obliquely. If the prefix "anti-" is **not** used, the first argument (i.e., the subject) is demoted. If the prefix "anti-" **is** used, then the second argument (i.e., the first object) is demoted.

For example, a passive demotes the first argument, and allows it to be expressed obliquely. An anti-middle demotes the second argument and suppresses its salience so much that it cannot be expressed obliquely.

Here is a complete list of middle and passive suffixes:

        vo-     passive
        voy-    anti-passive

        so-     middle
        soy-    anti-middle

As stated earlier, if it is necessary to demote the third argument of a ditransitive verb, an appropriate argument structure suffix should be used. For example, if we wish to perform a middle operation on the third argument of an A/P/F verb (i.e., an "anti-anti-middle" operation), then we will use either the A/P-s suffix "-vya" or the A/P-d suffix "-vyu", whichever is appropriate.

Obviously, this implies that the focus of these verbs can never be expressed obliquely and that we can no longer make a semantic distinction between anti-anti-passive and anti-anti-middle. However, I do not consider this a disadvantage because I know of no natural language that can do these things. <span id="S2_7_5"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.7.5 Disjuncts

When using verbs, we must be careful not to confuse case roles. It is sometimes easy to mistake a focal event for a patient. Consider the following example:

        It's sad that John died.

It is tempting to treat the embedded sentence "John died" as if it were the patient in a P-s state verb formed from the root meaning 'sad'. However, an event cannot be "sad" in the sense that it can experience sadness. What we are really describing are the feelings of the speaker (and perhaps others) towards the situation. Thus, when we say "it's sad that ...", we are really describing our feelings or beliefs about the situation. In effect, the speaker and those he may be speaking to are the real patients.

Thus, in a sentence like the above, the real patient is implied, and the mental state of the patient is 'focused' on the event indicated by the embedded sentence. Thus, the embedded sentence is the **focus** of the main state verb meaning 'to be sad about'.

We can easily create a basic P/F-s verb meaning 'to be sad about', as in the sentence "Bill is sad about his parents' divorce". Using this basic verb, we can perform a middle voice alteration to create the F-s \[-P\] form meaning 'it is sad that'.

It is also possible for an event to be the agent or cause of the sadness. For this, we would need an A/P-s verb, since the event itself causes the patient to be sad. Thus, we really have several possible forms, as illustrated below:

        A/P-s           John's death makes (i.e. keeps) me sad.
        A/P-d           John's death saddened me.
        P/F-s           I am sad that John died.
        F-s [+P]        It's sad (for everyone) that John died.
        F-s [-P]        It's sad that John died.
                OR  Sadly, John died.

A similar analysis can be done using the state concept 'hoping':

        P/F-s           I hope that I'll win.
        F-s [-P]        Hopefully, I'll win.

where both "sadly" and "hopefully" are actually verbs that take a complete embedded sentence as an argument - they are **not** adverbs as in English.

Words and expressions like these are called *disjuncts*, and many other examples can be derived in the same way: "to presume" -\> "presumably", "to be interesting" -\> "interestingly", "to be possible" -\> "possibly", "to be incidental" -\> "incidentally, by the way", "to be necessary" -\> "necessarily", "to be fortunate" -\> "fortunately", etc.

Finally, the unspecified arguments to many disjuncts are often provided by the speech situation, such as **who** is speaking, **who** is listening, **where** the speech is occurring, and so on. These are called *deictic disjuncts*, and I'll have more to say about them [later](#S15_5). <span id="S2_7_6"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.7.6 Voice Derivations

Here are some examples of derivations using voice suffixes and the root "gu", meaning 'to run/control/operate/manage/use':

        Middle P-s [-A] "guvyaso" - 'to be in use/operation'
            e.g. The computer WAS IN USE all day yesterday.

        Inverse P/A-s "guvyakwe" - 'to be under the control of'
            e.g. The project IS now UNDER THE CONTROL OF the
                engineering department.

        Anti-passive A-s [+P] "guvyavoy" - 'to be in control/charge'
            e.g. John IS IN CONTROL (of the project).

        Middle F-s [-AP] noun "gukasodi" = 'deed', 'act', 'action',

        Anti-passive AP-s [+F]: "gukavoy" - 'to be doing something',
                'to be busy/occupied (with his homework)'
        e.g. He IS BUSY right now.

<span id="S2_7_7"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.7.7 Voice Combinations

It is important to emphasize that the basic voice operations (middle, passive, and inverse) are **not** sequential. They act independently, as if each operation were the only one operating on the original argument structure. For example, if we apply middle and anti-passive to an A/P/F verb, the middle operation converts A to \[-A\], the anti-passive operation converts P to \[+P\], and the result is F \[-A\] \[+P\]. This combination is legal, and the order of application of the voice suffixes is irrelevant.

The net effect of this rule is that a core argument can only be affected once. For example, it is illegal to apply a passive and an inverse, since, independently, the passive would convert A/P/F to P/F \[+A\], while the inverse would convert it to P/A/F, and the two results are not compatible. In other words, the agent argument would have been affected twice, and the result would be ambiguous. If our goal is A/F \[+P\] (i.e., inverse followed by passive), then we should use a simple anti-passive (suffix "-voy"). If our goal is F/P \[+A\] (i.e., passive followed by inverse), then we're out of luck - there is no way of accomplishing this in the interlingua. Fortunately, I have not been able to find any use for it, and I doubt that any natural language has such a capability.

Later, we will learn of other voice operations ( [reflexive](#reflexive) and [reciprocal](#reciprocal)) that actually combine two separate core arguments into a single core argument. These voice operations are not considered basic and are not affected by the above rule. For example, it **is** possible to apply a passive after a reciprocal. In effect, a non-basic voice operation creates a new verb that can undergo normal basic voice operations. <span id="S2_8"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.8 More on Causation

In many of our verb derivations, we used the word "cause" in our paraphrases of the semantics of verbs which have an agent in their argument structure. Unfortunately, these paraphrases are approximate and often imply some distance between the agent and the event. However, I must emphasize that the agent argument of a verb is the entity that is **directly** responsible for the event indicated by the verb. Thus, there is a definite semantic difference between 'kill' and 'cause to die', even though our paraphrases may imply otherwise.

If we wish to intentionally put distance between an agent and an event, we must design words that are equivalent to English "cause", "make", etc. Consider the following sentences:

        He MADE his son wash the dishes.
        I HAD Bill deliver the package.
        He CAUSED his wife to have a miscarriage.

In the above examples, the patient (if that is what it really is) cannot be expressed directly:

        *He made his son.
        *I had Bill.
        *He caused his wife.

However, the English verb "to cause" can be used without this quasi patient:

        John caused the accident.

Thus, these verbs indicate that an **indirect** agent is responsible for an event which itself may have a **direct** agent - the quasi patient is not at all a true patient of the verb "cause/make/have" (although it may be the true patient of the embedded sentence). Also, the English distinction between "cause", "have", and "make" is somewhat idiosyncratic. Semantically, there is no significant difference between them. \[Actually, "to have" is a more polite version of "to make", but this distinction is not important to us here. We will discuss how to derive more polite forms of words in the section on [Register Variations](#S14_0).\] <span id="fi"></span>

The most neutral paraphrase of indirect causation is simply the static 'to keep in existence' or the dynamic 'to cause to become real/actual/existent'. In the interlingua, I will use the state root "fi" to represent this concept (default = P-s). Here are some useful derivations:

        A/P-d: "fivyu" - 'to cause/make/create/produce/implement', 'to
                cause to come into existence', 'to bring
                about/on', 'to cause to become real/actual', 'to
                make a reality'
            e.g. John CAUSED the accident.
             John MADE Billy wash the dishes.
             John MADE some apple cider.

        A/F-d [-P]: "fivusoy" - 'to implement/execute/carry out/bring
                about/put into effect or practice/accomplish/
                etc'
            e.g. They CARRIED OUT your orders.
             We have to IMPLEMENT the new plan by Monday.
             [The focus provides additional information about
             the unspecified patient without itself being
             affected.  Cf. "We made the boat according to these
             plans" vs. "We implemented these plans".]

        A/P-s: "fivya" - 'to ensure/insure/guarantee', 'to
                to make sure that ...', 'keep/maintain a reality'
            e.g. Skilled teamwork ENSURES high quality results.
                 John will MAKE SURE that there's enough food.
             
            [Incidentally, the opposite of "fivya" is "zanvya"
            and means 'to prevent or preclude'; i.e. to ensure that
            something remains non-existent.]

        P-s: "fido" - 'real', 'actual', 'existent'
            e.g. John said he saw a REAL unicorn.

        P-s: "fida" - 'to be real/actual', 'there be',
                'the reality is that', 'In reality ...',
                'Actually, ...'
            e.g. THERE ARE ten people at the party.
             THE REALITY IS THAT they're all gone.

        P-d: "fisyu" - 'to come into existence', 'there came to be',
                'it came to be that', 'to become a reality', 'to
                become real', 'to come about', 'to happen', 'it
                happened that', etc.
            e.g. The new policy CAME INTO BEING after he resigned.
             The accident HAPPENED because of poor visibility.
             THERE CAME TO BE fewer people willing to help.
             IT CAME TO BE THAT fewer people were willing to
                help.

Note that English uses different forms depending on whether the focus is a noun phrase (i.e. an entity) or an embedded sentence (i.e. an event). <span id="S2_9"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 2.9 Focused versus Unfocused

In the interlingua, an unfocused derivation will have exactly the same semantics as the corresponding anti-middle derivation **if** the root is focused by default. If it is not focused by default, then the semantics will be different, as we will discuss [later](#S4_5). Thus:

        AP-x    is equivalent to   AP-x [-F]
        P-x     is equivalent to   P-x [-F]

For example, P-s "konsya", meaning 'know (intransitive)', is equivalent to P-s \[-F\] "konsoy".

Note that, since we have not implemented an anti-anti-middle or an anti-anti-passive, A/P-d "konvyu", meaning 'to inform (transitive - **not** ditransitive!) is equivalent to either the anti-anti-middle or the anti-anti-passive of "konvu".

\[Implementation detail: when the parser detects an unfocused suffix attached to something that is focused, it will convert it to a focused version with an appropriate voice suffix. For example, "konsya" will be converted to "konsoy", and "konsyado" to "konsoydo". This approach has two advantages: first, the translator will know that a voice operation has taken place (this knowledge is often essential for a correct translation); second, the dictionary will not need to have two entries for the same concept - only the focused entry will be needed.\]

This approach has an important implication that may not be immediately obvious. Since middle derivations indicate that the demoted argument is generic, the lack of a middle voice change indicates that the argument must either be explicitly specified or is intentionally being withheld by the speaker. And if it is being withheld, then it is equivalent to an appropriate passive operation. Here are some examples that should help illustrate this point:

        konda = P/F-s verb meaning 'to know'
        konsyado = konsoydo = P-s [-F] adjective meaning 'knowing',
                     'cognizant', 'in the know'
        kondo = ???

Since "kondo" is focused but does not have an explicit focal argument, the argument is being explicitly withheld. In other words, it is equivalent to an anti-passive:

        kondo = konvoydo = 'knowing something that the
            speaker doesn't know or isn't telling'

Note that even though the form "kondo" is effectively anti-passive, it is still more general than the unfocused form "konsyado/konsoydo", and will be applicable in all situations. The unfocused adjective should only be used to emphasize that the focus is generic. And since English rarely (if ever) makes this distinction, both forms of such derivations will generally have the same English translation.

\[Incidentally, we can never use the open-adjective form "konvoydu", since the "-du" ending explicitly states that an argument follows even though the argument structure does not allow an argument. Since this is a contradiction, we will never use derivations of this type. We'll have more to say about the open adjective part-of-speech suffix "-du" later.\] <span id="S3_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 3.0 Nouns

By now, it should be obvious that word design can be extremely productive in a language possessing a rich classificational morphology. This kind of morphology allows the language designer to create a large vocabulary with semantic precision, while minimizing the number of root morphemes needed. However, so far we've only used this approach to design basic **verbs**. We now need to see if a similar approach can be used to design basic **nouns**.

I began my discussion of verbs by providing a large number of examples that I placed into groups based on their argument structures. I felt that this was necessary because my approach to classifying verbs is unusual (and probably unique).

For nouns, though, I don't think that large numbers of examples will be needed, simply because the classes and their semantics are fairly obvious.

\[Incidentally, I am not aware of any other work that classifies verbs as I have done here. Initially, I was tempted to adopt the more widely accepted Vendlerian analysis which classifies all verbs into the four major categories: *state* (e.g. "to know", "to love"), *activity* (e.g. "to run", "to sing"), *accomplishment* (e.g. "to sing a song", "to write a book") and *achievement* (e.g. "to die", "to find"). However, although I experimented with these four categories, I was very unhappy with the results. The standard categories seemed too vague, and I often had difficulty deciding which category a verb belonged to. An even greater disadvantage is that they provide almost no information about the semantics of the words. In any case, I felt that I needed a more productive system, and eventually ended up with the approach that I am using here.\] <span id="S3_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 3.1 Basic Noun Classes

Before starting, let's precisely define what we mean by the expression "basic noun". Here is the definition that I will use:

> A basic noun will represent an entity that has an actual physical existence (including extinct entities as well as entities from fantasy, mythology, etc.). Thus, such an entity must be composed of matter, energy, a combination of both, or time. Furthermore, characteristics which distinguish it from other entities must be verifiably physical (as opposed to functional, social, cognitive, etc).

Note that my definition is purely semantic and has nothing to do with how a word is actually used in a sentence. Thus, for example, we will derive the word for "window" as a basic noun, while the word for "learner" will be derived from a basic verb (as we illustrated earlier), even though both are used as nouns in a sentence. The word "window" is a basic noun because it can be uniquely described using only its physical properties. The word "learner", however, must be derived from a verb, even though it represents a physical entity, because it does not differ from other related entities (such as "informer" or "knower") in a verifiably physical way. In other words, we cannot distinguish a "knower" from a "learner" or determine their respective natures by examining only their physical traits. Their differences lie in what they **do**, not in what they **are**.

I will classify most basic nouns as follows:

        1. An entity represented by a basic noun must consist of
           matter, energy, a combination of both, or time.

        2. An entity of matter and/or energy represented by a basic
           noun must be either living or non-living.

        3. A non-living entity represented by a basic noun must be
           either natural or artificial.

So, using this approach, we can create the following basic noun classes:

        matter & energy:
            living, species         ->  man, lizard, clam, tree, bacteria
            living, organs          ->  hand, leaf, branch, liver, acorn
            living, diseases        ->  arthritis, pneumonia, claustrophobia
            non-living, natural     ->  storm, tide, geyser, rainbow
            non-living, artificial  ->  computer, airplane, oven, fountain

        matter:
            natural                 ->  salt, rock, cliff, river, island
            artificial              ->  key, statue, ax, book, wharf, house

        energy:
            living                  ->  ghost, angel, genie, demon, banshee
            non-living              ->  heat, thunder, sunshine, photon

        time:                       ->  winter, midnight, equinox, childhood

I am not making a distinction between natural and artificial, non-living energy because we would be forced to make useless distinctions. For example, "light" from the sun would require a different classifier than "light" from a light-bulb.

The 'living, organs' category includes all parts of living organisms that themselves contain life. Thus, "acorn" is considered an organ, while "shell" (e.g. clam shell) and "hair" are considered 'matter, natural'.

The 'living energy' category includes anything related to the supernatural, including mythological creatures that are primarily spirit-like (such as banshees and fairies). Mythological creatures that are primarily physical will be placed in an appropriate physical class. For example, the word meaning 'dragon' will be in the lizard class, 'minotaur' will be in the mammal class, and so on.

I believe that the above classes are fundamental, and that any useful system should contain at least these ten classes. However, we will also provide additional sub-classes for classes that have a large number of members. For example, in the 'matter & energy, living, species' class, it will be useful to distinguish between plants and animals. In fact, we will create even finer distinctions, such as between 'mammal', 'bird', 'fish', 'insect', etc. In the 'matter, artificial' class, it will be useful to distinguish between substances (e.g. "plastic"), locatives (e.g. "wharf") and others (e.g. "hammer"). The same substance/locative/other distinction will also be applied to the 'matter, natural' class to allow us to distinguish between words such as "water" (substance), "cliff" (locative), and "boulder" (other).

If we make these additions, our chart will look like this:

        matter & energy:
            living, species
                vertebrates:
                    mammals         ->  man, tiger, mouse, deer, dolphin
                    birds           ->  hawk, ostrich, canary, penguin
                    reptiles & amphibians
                                    ->  lizard, snake, turtle, frog, newt
                    fish            ->  trout, halibut, perch, lamprey
                    other vertebrates
                                    ->  none (see below)
                arthropods          ->  ant, bee, crab, mosquito, grasshopper
                other animals       ->  clam, jellyfish, snail, worm, clam
                plants (including kingdoms Monera, Protoctista, and Fungus):
                    trees           ->  tree, oak, shrub, apple, juniper bush
                    other plants    ->  grape, morning glory, horsetail, moss
            living, organs          ->  hand, leaf, branch, liver, ear
            living, illnesses       ->  smallpox, rheumatism, cancer, flu
            non-living, natural     ->  tornado, geyser, rainbow, earthquake
            non-living, artificial  ->  lathe, telephone, pump, robot, clock

        matter:
            natural,
                    substance       ->  water, sand, bauxite, ivory, urine, air
                    locative        ->  planet, river, island, mountain, bay
                    other           ->  boulder, fang, stalagmite, shell

            artificial,
                    substance       ->  plastic, benzene, steel, cloth, glue
                    locative        ->  wharf, city, road, school, stadium
                    other           ->  window, statue, desk, book, nail

        energy:
            living                  ->  ghost, jinni, god, devil, banshee
            non-living              ->  heat, thunder, photon, noise, light

        time:                       ->  winter, sunset, equinox, infancy

The non-living, artificial matter & energy class will represent powered items that typically do not run on only human or animal power; e.g., an electric drill, but not a hand-powered drill.

Note that I use the word "locative" in the following sense: a locative noun represents an entity which typically is built in place or evolves naturally in a single location, which is extremely difficult (if not impossible) to move to a different location, which is relatively permanent, and which is typically considered a place where humans can go to, remain at, or depart from. Again, the choice may seem subjective. For example, "wharf", "staircase", "bleachers", and "gallows" will be artificial locatives, but "beehive", "den/burrow", and "nest" will not be locatives. Instead, they will belong to the 'natural other' class. <span id="S3_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 3.2 Noun Design Algorithm and Examples

In the interlingua, we will create classifiers for all of the above classes and sub-classes. In addition, since there are many more possible classifiers than will be needed, we will sub-categorize the classes even further. For example, the 'natural substance' sub-class will have the following classifiers and associated sub-categories:

      -gen  chemical elements (hydrogen, oxygen, sodium, chlorine, uranium)
      -ca   inorganic compounds (water, sodium chloride, potassium sulfate)
      -byo  biochemicals, including drugs (aspirin, vitamins, insulin, DNA,
          nucleotide, amino acid, drugs for high blood pressure,
          depression, heart disease, etc)
      -jun  other organic compounds (methane, butanol, polybutadiene,
          benzoic acid, chlorobenzene, dimethylamine)
      -xu   plant/animal substances and mixtures (blubber, frankincense,
          beeswax, fur/hair, beef, honey, blood, wood, marrow, milk,
          feces, coral, tears, spit/spittle) 
      -vin  other (air, coal, soil, clay, bauxite, dust, sand, ore, ruby,
          snow, gypsum)

A complete list of all the classifiers is provided in [Appendix C](#APPENDIX_C).

Each semi-root has a default class; i.e., a default semantics and syntax. For example, as we saw earlier, the semi-root "kon" is a P/F-s mental state by default. The class of a root that has more than one semi-root is determined by the rightmost semi-root, and this semi-root is referred to as the *classifier*.

A class can contain more than one classifier; i.e. it can contain sub-classes, and they, in turn, can also contain sub-classes. For example, the 'vehicle' class has a classifier meaning 'vehicle' and an additional classifier meaning 'water vehicle'. Each specific type of water vehicle (eg. canoe, raft, rowboat, barge, catamaran, cruise ship, pinnace, etc) will use the 'water vehicle' classifier, while non-water vehicles will use the 'vehicle' classifier. In effect, the 'water vehicle' class is a sub-class of the 'vehicle' class, and all vehicles that travel in or on water will use it instead of the 'vehicle' classifier. <a href="" id="ce"></a>

A stand-alone classifier (i.e., one that is not modified by other semi-roots) will represent a specific member of the class, rather than the entire class. For example, the 'bird' class has a 'bird of prey' sub-class. When the 'bird of prey' classifier is used alone, it will actually represent the particular category of birds called 'hawks' rather than the more general meaning 'bird of prey'. This classifier can then be modified by other semi-roots to represent other birds of prey such as 'eagle', 'falcon', 'vulture', and so on. If we need to create a root representing the entire class, we will modify the classifier with the semi-root "ce", meaning 'member'. For example, the 'member' semi-root plus the 'bird of prey' classifier means 'bird of prey', and can refer to any member of the class.

Classes that have sub-classes will have one final class called an 'other' class, and "ce" will be used with this classifier to represent any member of the larger class. For example, there are several 'bird' sub-classes (such as the 'bird of prey' class mentioned above), and one final class called the 'other birds' class. This final class will be used for all bird species for which there is not a more specific bird class, and the root meaning 'bird' is simply "ce" plus the 'other birds' classifier.

The member semi-root "ce" will not be applied to a classifier unless the result is useful and has a counterpart in many natural languages. For example, there is a classifier for 'government and military groups or organizations'. Since I doubt that any natural language has a single word to represent this concept, we will not create a generic word using "ce" plus this classifier.

Note that a specific member of a class does not have to represent a single species or a single kind or type of entity. For example, there is a stand-alone semi-root meaning 'crab' that does not have any sub-classes, even though there are several species of crab. (This also applies, of course, to 'hawk'.)

The classifier semi-root of a root is semantically and syntactically precise. However, the semi-roots to the left of a classifier will provide no syntactic information at all and may not necessarily be semantically precise, but **will** provide semantic clues that will help the student remember the meaning of the complete root. In other words, the semi-roots to the left of the classifier will be used for their *mnemonic* value to modify the classifier. The classifier, however, will always be semantically precise. For example, the root meaning "bicycle" consists of the numeric semi-root meaning 'two' plus the 'vehicle' classifier.

Also, some semi-roots can have completely different meanings in different contexts. For example, the semi-root with the meaning 'six' would be useless with most classifiers except the numeric classifier and certain shapes (such as the hexagon). In cases like this, the semi-root can be given one or more completely different meanings that will be more useful in other contexts. Even so, however, we will always try to assign multiple meanings that are at least somewhat reminiscent of or related to each other. For example, the semi-root meaning 'six' will have the alternate meanings 'spider' (because a spider has six pairs of appendages and typically has six spinnerets), 'web/net', 'catch/trap', 'six', and 'white'.

In summary, a semi-root is used in four ways:

        1. as a stand-alone root which represents a specific member
           or sub-group of its class (eg. 'hawk' or 'crab')

        2. as a classifier that can be modified by other semi-roots
           to represent other specific members of its class
           (eg. 'osprey' of the 'bird of prey' class or 'hermit crab'
           of the 'crustacean' class)

        3. as a classifier modified by the 'member' semi-root to
           represent any member of the class (eg. a single root
           meaning 'bird of prey' or 'crustacean')

        4. as a semi-root that modifies other classifiers and
           provides a mnemonic clue to the meaning of the result
           (eg. the 'spider' semi-root can be used as a modifier to
           derive new roots with meanings such as 'weave', 'silk',
           'web', 'six', and so on.

Thus, the approach used here will allow an entire, easily learned vocabulary of roots to be flexibly designed using a relatively small number of semi-roots.

Now, let's design some words. We'll start with the word for 'water'. In the interlingua, the semi-root "ca" will mean 'water' when used alone, it will represent the class 'inorganic compounds' when used as a classifier, and it will have the vague senses 'water/wet/liquid/clean/etc' when used as a modifying semi-root. Thus the stand-alone word for 'water' is simply "cadi", and it is P-s by default. Note that the noun suffix "-di" must be used to indicate that the word is a noun. \[We'll see [later](#S3_3) what happens when we change its argument structure with a suffix.\]

Here are several other useful derivations using the semi-root "ca-" (refer to [Appendix C](#APPENDIX_C) for the complete list of classifiers):

        matter & energy:
            living, species
                    mammal          ->  cavondi - hippopotamus
                    birds           ->  cabodi  - duck
                    fish            ->  cajedi  - puffer/blowfish
                    reptiles        ->  casindi - water snake
                    insects         ->  caxaydi - mosquito
                    cephalopods     ->  cazaydi - squid
                    other animals   ->  cadindi - jellyfish
                    trees           ->  caxadi - tupelo/black gum/sour gum
                    other plants    ->  cadondi - marsh fern
            living, organs          ->  cabendi - bladder (e.g. urinary or gall)
            non-living, natural     ->  cajindi - spring (water from the ground)
                                    ->  catondi - rain(fall)
            non-living, artificial  ->  cabyadi - washer/washing machine

        matter:
            natural,
                    substance       ->  cadi    - water
                    locative        ->  cafedi  - oasis
                    other           ->  cadundi - drop/droplet

            artificial,
                    substance       ->  cacodi  - soup
                    locative        ->  calaydi - canal
                                    ->  catodi  - bathroom
                    other           ->  capendi - sink, washbasin

        energy:
            living                  ->  capondi - undine, water spirit
            non-living              ->  cadendi - hydropower

        time:                       ->  cakundi - monsoon, rainy season

<span id="S3_3"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 3.3 From Basic Noun to Other Parts-of-Speech

The simplest kind of derivation is to change the part-of-speech. In the interlingua, the verb form will have the meaning 'to be X', and the other forms will be interpreted in the usual way. Thus, for example, the word "caboda" would be a P-s verb meaning 'to be a duck'. The adjective form, "cabodo", would be used in expressions such as "Billy the duck", "duck egg", and any other modification that is inalienably 'duck'. The adverb form "cabode" would have the meanings 'being duck', 'since it is (a) duck', 'since they are duck', etc. Note that this approach is perfectly consistent with the rules we adopted for basic verbs.

We can also change the argument structure to something other than P-s. When doing so, the basic noun will represent the state, and the verb suffix will apply to the state in the usual way. For example, P-d "cabosyu" would mean 'to become a duck', A/P-d "cabovyu" would mean 'to change P into a duck', and so on. <span id="S3_4"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 3.4 Semi-Roots Plus Verb and Adjective Classifiers

In the previous section, we used the semi-root "ca" to modify several noun classifiers. We should also be able to derive useful words by applying it to verb and adjective classifiers. With verb and adjective classifiers, we will apply "ca-" with the sense 'water' where it is useful, and with the more general sense of 'wet' or 'liquid' in other cases. Here are some examples (refer to [Appendix C](#APPENDIX_C) for a complete list of classifiers):

        cabido   ->  "-bi" = a scalar, non-relational state classifier, P-s
                        adjective: wet, damp, moist
        cabida   ->  P-s verb: to be wet
        cabivyu  ->  A/P-d verb: to wet/moisten (transitive)
        cabisyu  ->  P-d verb: to get wet
        caloda   ->  "-lo" = activity classifier, AP-s verb: to
                        drink (intransitive)
        caxwada  ->  "-xwa" = involuntary act classifier, P-d verb: to drool

Here are some more examples using the semi-root "kon-", which we used to derive the verb "konda", meaning 'to know' or 'to have knowledge of'. We will expand its meaning to include the concept of 'learning/education' (refer to [Appendix C](#APPENDIX_C) for a complete list of classifier sub-categories):

        konmendi = school     - artificial location, site
        konjadi  = book       - artificial other, informative/...etc
        konjidi  = library    - building
        konteda  = explain    - speech act, A/P/F-d verb
        konloda  = teach      - activity, AP-s verb

Finally, don't forget that the above nouns can undergo still further derivation by adding suffixes to them as we illustrated earlier. For example, the word "konvinta" is the verb meaning 'to be human' and "konvinto" is the adjective meaning 'human'. <span id="S3_5"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 3.5 Abstract Nouns

There are many nouns that are difficult to classify because of their inherent abstractness. Some of these nouns refer to concepts such as language (e.g. French), culture (e.g. Arab), race (e.g. Caucasian), nationality (e.g. Swiss), and religion or ideology (e.g. Christian). These, however, are all proper nouns, and I will postpone discussion of them until later, in the chapter on [Proper Names, Borrowed Words, Abbreviations, and Vocatives](#S24_0).

There are also concepts that are more general in nature and which typically describe human activities, the abstract products of such activities, the components of such products, and so on.

The question, though, is: What are these words? Are they nouns? Are they verbs? Or are they something else?

To answer this question, consider the English words "mathematics", "opera", and "adjective". If they are inherently verbs, then why do we never use them as verbs? They are always used as nouns. And if they are inherently stative, then why can we never use them as adjectives? In fact, if they were inherently stative, we would not need to derive such words as "operatic", "mathematical", and "adjectival".

The only conclusion that makes any sense is that these words are inherently **nouns**.

So, if they are indeed nouns, then how do we classify them?

Consider the word "opera". We might be tempted to classify it as non-living, artificial matter & energy. However, this would put it into the same category as "jacuzzi", "computer", and "automobile". For some reason or other, my mind rejects the idea that "computer" and "opera" are in the same class.

And what about "mathematics", "adjective", and "poem"? Should they be placed in the non-living energy class? If so, they would be classified along with "electricity", "light", and "thunder". Again, my mind rejects this categorization.

One thing that should be fairly obvious by now is that noun classification is inherently arbitrary, and that there is no way to avoid this arbitrariness. We can see logic and structure in the design of verbs, but nouns resist any truly logical classification. The reason for this is simply that nouns represent the products of an essentially random universe. For example, if you look at a diagram that classifies the animal kingdom, you'll find that some main branches have very few sub-branches, while others have numerous sub-branches with sub-sub-branches, and so on. You will also find that some entities resist accurate categorization into any single class.

We can only expect that this inherent arbitrariness will be even more prevalent when dealing with more complex, abstract concepts, especially when we add concepts that represent **human** activities.

Thus, the only recourse in dealing with these words is to create whatever classes are needed, in the same way as we did for the non-abstract noun classes. Fortunately, we won't need many classes to achieve our goal. In fact, we need very few. \[For a complete list with English examples, refer to [Appendix C](#APPENDIX_C), sections ["Groups/organizations"](#group_class) through "Performances".\]

It's important to emphasize that abstract classes apply to what sentient creatures do, **not** to what non-sentient creatures do or to what nature does. We must make a distinction between the phenomenon being studied or applied and what the student or practitioner actually does. For example, the word meaning 'climate' is a member of the non-living, natural, matter & energy class, whereas 'climatology' is a field of study. In other words, two classes will be needed: the natural phenomenon to represent what is being studied, and the field of study to represent what the student or practitioner actually does.

Many performances have basic verbal activities associated with them. In these cases, we will use the same semi-root with both the performance classifier and the activity classifier. And since the activity classifier is not an abstract classifier, it can also be used for non-sentient activities. Here are some examples:

        konzindi - teaching/education (P-s noun)
        koncindi - teacher (P-s noun)
        konbindi - faculty (P-s noun)
        konloda - teach (AP-s verb; e.g. "He teaches at the high school")
        konlovu - teach (A/P/F-d verb; e.g. "He taught me math")
        konlovyusodi - pupil (P-d [-A] noun)

There is an important distinction between the member derivation and the agentive noun derivation. For example, both "koncindi" and "konlodi" can be translated as 'teacher'. However, "koncindi" will be the most commonly used word because it applies to teaching in general, whereas "konlodi" applies only to a specific instance of teaching. English generally does not make this distinction, although there are exceptions; cf. "studier" vs. "student". In the interlingua, we will not use the agentive noun derivation unless we wish to explicitly refer to specific instances of the activity.

\[Implementation note: if the member or performance translations can be regularly derived from the activity derivation, then only the activity derivation will appear in the dictionary for the target language. For example, "konloda" will appear in the English dictionary, but "konzindi" and "koncindi" will not, because "teaching" and "teacher" can be easily derived from "teach".\]

When deriving rank and title words, there will often be cases where a particular profession has a hierarchy of many ranks; e.g., the military, the nobility, corporate management, religious organizations, etc. In these cases, we will create a compositional derivation consisting of an appropriate root for the profession prefixed by a number semi-root (meaning 'one', 'two', 'three', etc). The number 'one' will be used for the highest possible rank (emperor, pope, CEO), 'two' for the next highest (king, cardinal, vice-president), and so on. \[We'll discuss numeric derivations later in the chapter on [Counts and Measures](#S9_0). For example, the numeric semi-root meaning 'one' is "ca-", which we can use to create the word "cakoncindi", meaning 'professor'.\]

Along with ranks/titles and professions, we will also need to represent the actual jobs or positions associated with them. English sometimes has special words to represent these jobs, such as "professorship" and "bishopric", but most of the time, it simply modifies one of the words "job", "position", or "office"; (e.g. "The professor's position is still open" or "Bill wants the new engineering job").

In the interlingua, we will not allocate separate classifiers for this concept. Instead, we will create a word meaning 'job/office/position' and modify it as needed. And since this word actually represents a performance instantiation, it will be derived using the performance instantiation classifier. <span id="S3_6"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 3.6 Mass, Count, and Group Distinctions

Many nouns have separate forms that differentiate between homogeneous entities, individuals, and groups of individuals. These are referred to, respectively, as *mass nouns*, *count nouns*, and *group nouns*. Here are some English examples:

        Mass            Count                   Group
        ---------       -----                   -----
        mutton          sheep                   flock
        grass           blade of grass          lawn
                ship                    fleet
        foliage         leaf
        beef            steer                   herd/cattle
        hair            hair, strand of hair    wig
        rice            grain of rice
        guts/flesh      organ                   body
        wood            tree                    grove, wood
                map                     atlas
        water           drop                    shower

Note that English mass nouns are never used in the plural (\*muttons, \*beefs), while count and group nouns have both singular and plural versions. (However, some English nouns can have more than one sense; e.g. "hair" and "wood".)

Incidentally, do not confuse group nouns discussed in this section with the abstract noun group class discussed in the previous section. Here, we are referring to natural groupings of any basic noun. The separate group class, however, refers to groups of diverse, sentient elements (typically human, although they could also include or consist of members of intelligent alien species) linked by one or more activities specifically associated with the group. The groups discussed in this section do not imply any specific type of activity. These are physical groupings that describe what a group is - not what it does.

In the noun derivation scheme discussed earlier, some classes contained only count nouns while others contained only mass nouns. Specifically, in the 'matter, non-living' classes, 'substances' are inherently mass nouns, while 'locatives' and 'others' are inherently count nouns.

Note, though, that in our derivations, the 'other' counterparts of 'substance' nouns are not necessarily their count equivalents. For example, "cacodi" = 'soup' does not have a counterpart meaning 'soup drop', whereas "cadi" = 'water', **does** have the approximate counterpart "cadundi" = 'drop/droplet'. If we really need to emphasize that the drop is water, oil, or some other substance, then we will use a compound or periphrasis as we do in natural languages; e.g. "waterdrop" or "drop of oil". (We'll see how to do this later in the chapter on [Compounding](#S22_0).)

In other words, we will take advantage of the count/mass distinctions provided by our classificational system only when it is useful.

Note also that, even though "cadundi" is classed as a natural substance, it still can be applied to non-natural substances. I doubt if any natural language makes a distinction between 'natural substance drop' and 'artificial substance drop', and requiring that kind of distinction in the interlingua will only increase the difficulty of both learning and translation. <span id="group_sr"></span>

Now, the classificational system provides a mass/count distinction, but it does **not** provide a group concept. In the interlingua, we will use the semi-root "be" for this purpose. Also, when creating a group sense from a basic noun concept, "be" should always be applied to the count derivation, **not** the mass derivation, so that its class is correctly provided by the classifier.

\[Incidentally, "be" is the [classifier for 'other groups/organizations'](#group_class), and is also used in numeric derivations with the sense of 'numeric group'. We'll have more to say about numeric derivations [later](#S9_3).\]

Here are some examples of group nouns:

        bebaydi = pod (of dolphins, whales, or other marine mammals,
                  "-bay" = classifier for 'marine mammals')
        bevondi = herd or flock (of ungulates such as horses and sheep,
                  but NOT of birds, "-von" = 'ungulate' classifier)
        betawdi = flock (of birds, "-taw" = 'other bird' classifier)
        betidi  = swarm (of insects, "-ti" = 'other insect' classifier)
        bejoydi = fleet ("joydi" = 'ship/boat')
        bezodi  = school (of fish, "-zo" = 'other fish' classifier)

Note that, unlike English "flock", "betawdi" can only be used with birds. For example, we cannot use "betawdi" in 'flock of sheep'. Instead, we must use "bevondi".

We'll have more to say about the count/mass distinction in the chapter on [Counts and Measures](#S9_0). <span id="S3_7"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 3.7 Generic Nouns

As we mentioned [earlier](#ce), we can create generic words that can represent any or all members of a class using the generic semi-root "ce-" plus an appropriate noun classifier. Here are a few examples:

        matter & energy:
            living, species
                animal        ->  cedindi 'animal'
                    mammal    ->  cegadi  'rodent'
                    bird      ->  cetawdi  'bird'
                    fish      ->  cezodi  'fish'
                    reptile   ->  celoydi 'reptile'
                    amphibian ->  cefwadi 'amphibian'
                plant         ->  cedondi 'plant'
                    tree      ->  cexadi 'tree'
            living, organs    ->  cexoydi 'organ', 'living body part'
            living, illnesses ->  cetwedi 'illness/disease'
            non-living,
              natural         ->  cejindi 'phenomenon'
            non-living,
              artificial      ->  cebyadi 'device', 'mechanism',
                                          'appliance', 'apparatus'

        matter:
            natural,
                substance     ->  cexudi  'stuff', 'substance' (natural)
                locative      ->  cefedi  '(natural) location/place/spot'
                other         ->  cegaydi '(natural) thing'

            artificial,
                substance     ->  cegedi  'stuff', 'material' (artificial)
                locative      ->  cefawdi '(artificial or man-made)
                                             location/place/spot'
                other         ->  cedandi '(artificial) thing', 'item',
                                            'object'

        energy:
            living            ->  cepondi 'spirit/ghost'
            non-living        ->  cedendi 'energy'

        time:                 ->  cekundi 'time', 'duration'

        abstract nouns:       ->  cezidi  'unit of measure'
                              ->  cebedi  'group/organization'

We will adopt the convention of using the "natural" derivations for general use, unless the nature of the substance/location/item is known. For example, we will use "cefedi" rather than "cefawdi" for the generic term meaning 'location', 'place', 'spot', etc. <span id="S4_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 4.0 Case Tags

So far, we've discussed the major case roles of agent, patient, agent-patient, and focus, and mentioned in passing a few oblique roles, such as instrument and manner. We also spent a considerable amount of time showing how to convert verbs to case tags and adverbs. In this section, I'd like to discuss how to create oblique case tags for **any** case role, especially the more traditional ones that, in English, are called "prepositions". <span id="S4_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 4.1 Review of Case Role Semantics

A sentence consists of a main verb and its arguments, and each argument has a case relation associated with it. For example, a sentence like:

        On Tuesday, John moved the crate to the storeroom with a forklift.

can be analyzed as follows:

      move: agent           ->      John
            patient         ->      the crate
            destination     ->      the storeroom
            instrument      ->      a forklift
            time            ->      Tuesday

In effect, the prepositions "on", "to" and "with" are **labels**; i.e., they name or 'tag' the roles played by their arguments. In English, the core roles of agent and patient are not explicitly labeled, but are indicated by the meaning of the verb and the relative positions of subject and object.

Also, keep in mind that an oblique case role not only modifies the entire event headed by the verb, but it also often has a strong link to an argument of the main verb. Thus, an instrumental case tag can be derived from an A/P-s verb meaning 'to use', and equates the subject of the main verb with the subject of the case tag. Adverbs are derived from intransitive verbs and also link to an argument of the main verb, but do not themselves have arguments.

To create case tags, then, all we need to do is start with a verb that has the appropriate functional meaning and mark it in some way to show that it is a case tag. This, of course, is exactly what we did earlier when we converted verbs to case tags and adverbs. However, we did it with a literal twist - when we convert a verb to a case tag, the 'label' sense of the case tag derives from the **object** of the case tag - **not** from the subject. In effect, for the 'label' sense, we actually used the noun derivation of the **inverse** of the verb.

Since this may not be immediately obvious, consider our derivation of the instrumental sense of 'with':

        I broke the window with a hammer.
        I broke the window using a hammer.
            to use: A/P-s

Whenever we convert a basic verb such as "to use" to a noun, we give it the meaning of a generic **subject**. If we were to use **this** noun sense for a case tag, it would give us the meaning of 'user' - **not** the item used. Thus, the 'label' sense of "instrument" actually comes from the generic **object** - what we might call the 'usee'. If, instead, we performed an inverse voice change on the verb and converted the result to a case tag, we would then get the 'label' sense of 'user' (which for this verb does not make sense.)

This can cause problems, however, since the case role of a generic object can be the same for different verbs derived from the same root. For example, the AP/F version of a verb differs from its P/F counterpart **ONLY IN THE SEMANTICS OF THE SUBJECT - NOT IN THE SEMANTICS OF THE OBJECT**. A case tag, however, must capture the semantics of the object. Consider the following examples:

        I watched as the soldiers surrounded the compound.
            'to surround' = AP/F-d
        I noticed that the soldiers already surrounded the compound.
            'to surround' = AP/F-s
        I could see that the fence surrounded the compound.
            'to surround' = P/F-s

Obviously, we would like to create the equivalent of the English preposition "around" from the verb "to surround" (as in "They built a fence around the compound"). But which version of the verb do we use? The case role of the object is the same for all three verbs. They differ in the case role of the subject and in whether they are static or dynamic.

The static/dynamic distinction is an important one, and although it does not appear in the English preposition "around", it does appear in other prepositions; e.g. "They jogged IN the park" versus "They jogged INTO the park". And since it is semantically valid, I feel that we **should** make this distinction, even though the English equivalent of this particular case tag is ambiguous.

This still leaves us with the problem of deciding whether to use the AP/F or the P/F verb or both.

First of all, we don't need both forms for the simple reason that the main verb makes the necessary distinction, and there is no need to repeat this distinction in the case tag. The only real function of the case tag is to indicate the state of the patient while linking it to the main verb. How it got to that state is not important. Thus, only the P/F form is needed. Of course, if the patient of the main verb is also the agent, then it, by default, becomes the agent of the state indicated by the case tag. Thus, there is no need to indicate agency in this particular case tag, and doing so is simply redundant.

This does not mean that a speaker should never use the AP/F version of 'around'. There may be some situations in which such forms could be used to indicate emphasis, subtlety, or precision. <span id="S4_1_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 4.1.1 Non-Linking Adverbs and Case Tags

There will be times when a case tag is needed that is as semantically imprecise as its counterpart in a natural language. For example, during the analysis phase of machine translation from a natural language to the interlingua, it may not be possible to determine the more precise version of the case tag.

In the interlingua, we will accomplish this by allocating three special suffixes. They will effectively remove any link with the subject of the main clause, and will also eliminate the static/dynamic distinction. Here are the three suffixes that we will use:

      0/P   "-se" - case tag
            The argument which follows this case tag is an argument of the
            verb and is somehow affected or potentially affected by the
            event.  There is no indication of whether the argument is
            affected statically or dynamically.

      0/F   "-swa" - case tag
            The argument which follows this case tag is an argument of
            the verb and is somehow a focus of the event.  There is no
            indication of whether the result is static or dynamic.

      "0"   "-koy" - adverb
            This suffix creates an adverb which modifies the verb and
            which is not explicitly linked to any of the other arguments
            of the verb.  There is no indication of whether the result
            is static or dynamic.

Note that distinct suffixes must be created, since all classifiers and other suffixes clearly indicate whether they are static or dynamic. Thus, these new suffixes are intentionally vague.

The last form (i.e. "0") should be used to create equivalents of many English adverbs that end in "-ly". For most of these adverbs, it is often unclear which core argument is being linked to, if any. Consider the following example:

        John quickly opened the door.

Does this imply that John acted quickly, that the door experienced quick movement, or that the entire event took very little time? If we use the P-s adverbial form "kanxede" (in the interlingua, the adjective "kanxedo" means 'fast/quick'), there is a strong implication of a link to either "John" or "the door" or both. However, the "0" form, "kanxekoy", does not have this implication. Thus, a P-s form has implications that a "0" does not have, making the "0" form more general. And since the "0" form is more general, it will generally be more useful.

Using the same reasoning, the 0/F suffix would be used to create the equivalent of the English preposition 'around' using the same root as the various versions of the verb 'to surround'. Later, we'll see an example of how to use the 0/P suffix when we discuss the [beneficiary](#S4_3_2) case tag.

Thus, by using specific forms (AP-s, P-s, etc), we can modify the verb while indicating a link to an argument of the verb (typically the subject). This is often necessary when we create one-time or nonce adverbs and case tags as we did earlier with the root "konda". By using the "0" and 0/F forms, however, we directly modify the verb. Another way of putting it is that the specific forms modify an argument while the non-linking forms modify an entire event. <span id="S4_1_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 4.1.2 Case Role Terminology

So far, we have limited ourselves to using the descriptive terms "core" and "oblique" when referring to case roles. We also mentioned in passing the terms "primary" and "secondary" when we discussed [exchange verbs](#transfer_verbs). At this point, I would like to review what these terms mean, since a good understanding of the distinctions between them will be useful in the upcoming discussions.

When referring to case roles, the term "core" refers to roles that are part of the valency of a verb and that have not been demoted. Thus, they always refer to the four major roles: agent, agent-patient, patient, and focus.

An "oblique" case role is not part of the valency of the verb, and must be marked in some way to indicate its function. In English, oblique case roles are introduced by prepositions. In the interlingua, they are introduced by case tags.

A core argument can be made oblique by means of a passive or anti-passive grammatical voice change.

A "primary" case role is a role that occurs naturally in the valency of an **unchanged** verb. Thus, a primary case role must always be either an agent, agent-patient, patient, or focus. Furthermore, an argument remains primary even if it is made oblique by means of a grammatical voice change. For example, the agent of the verb "kill" is a primary case role, whether it appears as the subject of the verb, or as the argument of the preposition "by" in a passive voice operation.

A "secondary" case role is a role that occurs naturally as an oblique argument of an **unchanged** verb. Thus, a secondary case role can **never** be the primary agent, agent-patient, patient, or focus of the verb. <span id="S4_1_3"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 4.1.3 Case Role Philosophy

Starting with the next section of this monograph, I will discuss in detail how to derive many of the traditional case tags that appear in natural languages. However, before doing so, I would like to briefly digress and comment on the philosophy of case tag design.

The derivational approach that we are using here is especially advantageous because there is no need to design a linguistically complete and correct case system. Linguists have yet to agree on such a system, and I sincerely doubt that it's even possible. However, using the approach described here, **any** verb can be converted to a case tag, as long as the result makes sense and performs the desired function.

\[Incidentally, it is also possible that the system I am presenting here has real theoretical validity. In other words, it's possible that there really **are** only four basic case roles, and that all of the other case relations are derivable from them. However, I am not making this claim for the simple reason that I don't know if it is true, although I suspect it is.\] <span id="S4_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 4.2 Primary Case Roles

Let's start by creating oblique case tags for the four primary case roles. These can be used to specify oblique A, AP, P, and F arguments in passive and anti-passive voice-changing operations.

As we discussed earlier, passive constructions remove an argument from the argument structure of a verb and make it optional. To specify the optional argument, we could use case tags derived specifically for agent, patient, agent-patient, and focus. However, most (and perhaps all) natural languages are not so semantically precise. For example, ANY passive construction in English allows the original subject to be specified obliquely using the preposition "by", regardless of the actual case role:

        The window was broken by the neighbors' son.
            - where "by" introduces an agent.

        The poem was memorized by all the children.
            - where "by" introduces an agent-patient.

        The thief was heard by an off-duty policeman.
            - where "by" introduces a patient.

Now, in the interlingua, we will allocate the special, true generic root "ma". This root will have no semantics of its own, but will instead take its semantics (including its class and part-of-speech) from the suffix that immediately follows it. When followed by one of the passive suffixes, it will be a 0/F case tag by default. Thus, the two passive case tags are:

        passive:            mavo    For oblique expression of original
                                    subject.  The English equivalent
                                    is "by".

        anti-passive:       mavoy   For oblique expression of original
                                    first object.  English does not have a
                                    formal anti-passive, so there is no
                                    standard English equivalent, although
                                    "of" is probably most common; cf. "John
                                    is the breaker OF the window".

where "vo-" and "voy-" are the suffixes we defined earlier to perform the two passive voice changes. Note that the passive and anti-passive suffixes normally convert a word to a verb; i.e., their default part-of-speech is verb. However, when "ma" is the root, the default part-of-speech of a suffix **does not apply** unless over-ridden by an explicit part-of-speech suffix. In effect, "ma" plus the suffix form a single root with its own default part-of-speech. <span id="S4_3"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 4.3 Secondary Case Roles

Now, if we really need to express the roles of agent, patient, etc. **precisely**, we can start with generic versions of the A/P-s, P/F-s and AP/F-s and invert them if necessary. When converted to case tags, these verbs will take on the 'label' meanings of 'semantic agent', 'semantic patient', etc. However, these derivations are **too** precise, since they clearly state whether they are static or dynamic. Thus, we now face the same problem we discussed earlier when we had to deal with case tags and adverbs that were too precise.

We solved that problem by allocating three suffixes for the "0/P", "0/F" and "0" non-linking argument structures. We now need to complete the set with two additional suffixes:

      0/A   "-ve" - case tag
            The argument which follows this case tag is an argument of
            the verb and is somehow responsible for the event.  There is
            no indication of who the patient is.  There is also no
            indication of whether the argument is affected statically
            or dynamically.

      0/AP  "-ke" - case tag
            The argument which follows this case tag is an argument of
            the verb and is somehow both responsible for the event and
            affected by the event.  There is no indication of whether
            the argument is affected statically or dynamically.

However, in order to form the needed case tags, we must attach the suffixes to a root because the morphology of the interlingua does not allow words without roots. We will solve this problem by using the true generic root ["ma"](#ma) which we introduced earlier. Thus, the four non-linking case tags are:

        Agent           ->      mave

        Agent-patient   ->      make

        Patient         ->      mase

        Focus           ->      maswa

As case tags, we could paraphrase them as "an agent being", "a patient being", etc.

It is important to emphasize that these case roles do **not** represent the same roles as the corresponding core arguments. They are **secondary** case roles. In the discussions that follow, we'll see how this distinction can be very useful.

By now, I assume that the semantics of case roles is reasonably clear, and that creating case tags for **any** role should not be too difficult. A little practice, however, never hurts. So, in this section, I will describe how to create case tags for some of the most common, traditional case roles.

In most of the following derivations, I will paraphrase the function of the case role with a standard template that will allow us to clearly and consistently capture the semantics of the case role. The template will have the form: "In the event in which X occurred, sub-event Y occurred". Here are some examples:

        He broke the window with a hammer.
        = In the event in which he broke the window, he used a hammer.

        He ran into the house.
        = In the event in which he ran, he 'became in' the house.

        He drove the car like a madman.
        = In the event in which he drove the car, he acted/behaved like
            a madman.

        I bought the car after we got married.
        = In the event in which I bought the car, the 'time locus' was
            after we got married.

And so on. By using a standard template, we can avoid ad hoc solutions that will just have to be redone later. <span id="S4_3_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 4.3.1 Instrument, Means, or Method

The means case role elaborates how the agent accomplished the event. In English, this case role is normally marked by the prepositions "with", "via", "by", or "by means of", depending on the nature of the argument. Here are some examples:

        He cooled the stew BY blowing on it.
        We solved the problem BY asking for help.
        He knocked the chair over BY kicking it.
        She explained BY MEANS OF a story.
        They isolated the virus VIA a new technique.
        He broke the window WITH a hammer.
        He called me ON his new cellular phone.
        I learned a lot about dolphins FROM an encyclopedia.

Note in the last five examples that "by means of", "via", and "with" can all be interchanged freely, while "on" and "from" are more limited. Thus, English uses "by" for this case role when the argument is a clause. Otherwise, it uses "via", "by means of", "with", "on", or "from".

As we discussed earlier, a generic A/P/F-d action verb indicates that the agent successfully affects the patient **BY MEANS OF** the focus, without specifying the precise action that was used. We also derived a generic AP/F-s action verb "guka" which means 'to do F' where, again, the focus elaborates what the agent-patient is doing. Thus, the focus of these verbs is actually the means case role since it elaborates what the agent actually did.

However, which form of the verb should we use? The A/F-s \[-P\] form, the A/F-d \[-P\] form, the AP/F-s form, or the AP/F-d form? In order to achieve the desired generality, we will have to use the 0/F suffix "-swa". This time, however, we must use it with the generic **action** root "gu". Thus, the final result is the generic 0/F action case tag, "guswa".

The instrument/means/method case role is often used with resultative semantics. Consider the following:

        (1) John painted the door green.
        (2) John "greened" the door by painting (it).

In (1), "green" is represented by a P-d adverb. In (2), "greened" is an A/P-d verb and is followed by the means/method case role. The sentence actually used will depend on whether the speaker wishes to emphasize the "painting" or the "greening".

We can also create another case tag from the verb meaning 'to use'. Here it is again:

        A/P-s: guvya - 'to run/control/operate/manage/use'
           e.g. John RAN/MANAGED the company for three years.
                He OPERATED/RAN the new lathe.

In this case, the case tag will be "guvyade". However, "guvyade" can only be used when its argument is a physical entity. It can never be used with a clausal argument. Also, "guvyade" is less general then "guswa" because it has a strong implication of control and thus adds emphasis to what's happening to the tool being used, which is probably not desirable in most cases. <span id="S4_3_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 4.3.2 Secondary Patient, Beneficiary, and Maleficiary

A *beneficiary* is the entity which may be **indirectly** affected by an event. Here are some examples:

        John washed the dishes FOR his wife.
        They took up a collection FOR John's widow.
        Bill bought some flowers FOR his girlfriend.
        She built the doghouse FOR the new puppy.
        He cooked supper FOR the children.

A possible paraphrase for the English preposition "for" in the above examples would be something like 'on behalf of', 'for the sake of', or 'in the interest of'. A more comprehensive and accurate paraphrase would be 'to (possibly) have an unspecified or generic positive effect on'. The concept of 'possibly' makes this last paraphrase more accurate because there is no indication that the beneficiary actually experiences a change of state - only that it may occur.

The label "beneficiary", however, is something of a misnomer, as can be seen in the following examples:

        He set the trap FOR the raccoon.
        I bought the itching powder FOR my roommate.

The first example is sometimes called a *maleficiary*, since the intended effect is clearly detrimental. The second example is ambiguous, since it is not clear whether the itching powder was purchased to be used BY the roommate or ON the roommate. Thus, a more appropriate name for this case role is *secondary patient*, since it is not always obvious if the intended effect is good or bad.

Here is an example of a standard paraphrase of this case role:

        He cooked supper for his wife.
        = In the event in which he cooked supper, he (possibly) had
          an unspecified effect on his wife.

Thus, the semantics of the secondary patient are simple: the agent of the main verb is responsible for the main event which may have an unspecified effect on a secondary patient. The context determines whether the intended effect is positive or negative, and the outcome is uncertain. Thus, the semantics of this case role are perfectly matched by the 0/P case tag "mase", which we derived [earlier](#S4_1_1).

Now, consider the following:

        The play was boring TO/FOR me but not TO/FOR Bill.
        The trip was wonderful FOR all of us.
        The box was too heavy FOR Dennis.

In the above examples, the secondary patient was clearly affected. In addition, the agent of the resulting state was not just the subject of the main verb - it was the entire clause to the left of "to/for". For example, it wasn't just the box that affected Dennis, it was the fact that the box was heavy that affected him (i.e., that prevented him from lifting it). Thus, if we want to more precisely indicate that the secondary patient was actually affected, we must use the more precise A/P-d generic derivation "mavyude", which will be a case tag by default. <span id="S4_3_3"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 4.3.3 Comitative (also called Accompaniment or Associative)

The *comitative* case role introduces additional participants in an event which are equal in function and importance to the **subject** of the verb. The English prepositions "with" or "along with" are normally used to mark the comitative case role. Here are some examples:

        He weeded the garden WITH his wife.
        They went to Boston WITH the children.
        She died in a plane crash ALONG WITH three other passengers.
        I ate supper WITH my family.

\[Do not confuse this usage with the instrumental sense of the word "with", as in "I ate supper WITH a fork", or with the manner sense as in "I washed the crystal WITH care". Natural languages have a bad habit of overloading their case tags. To add to the confusion, they rarely do it in the same way.\]

This case role is an unusual one, because it is actually an alternative to coordination, which is normally handled syntactically. Thus, the first example can be paraphrased as "He and his wife weeded the garden".

Some readers may argue, however, that use of the case tag "with" implies a certain degree of subordination which is not implied as strongly when using coordination. This apparent subordination, however, is a pragmatic effect - not a semantic one - and is implied by the context. In different contexts, the subordinating effect can be reversed:

        Billy went to the movies with his parents.
          (Billy accompanied his parents, and he was somehow
          subordinate or less in-control than his parents.)

        The Simpsons traveled to Boston with the children.
          (The children accompanied their parents and were
          somehow subordinate or less in-control than their
          parents.)

Thus, the implication of subordination, if any, can work both ways. Note, though, that the comitative argument is certainly less **topical** than the subject, which is to be expected since it is oblique.

In other words, the comitative case tag introduces an argument that performs exactly the same semantic role as the subject. The only difference is that the argument is reduced in topicality compared to the subject. Consider the following:

        1. Dad went to a movie WITH the kids.
        2. The kids went to a movie WITH dad.

In (1), "dad" is more topical than "the kids", while in (2) "the kids" is more topical than "dad". In both sentences, though, "dad" and "the kids" play **exactly** the same semantic role.

Now, if "Dad" and "the kids" were equally topical, we would instead say something like this:

        3. Dad AND the kids went to a movie.

In other words, a coordinating conjunction does not imply any significant difference in topicality.

However, we can reduce the topicality of a **part** of the subject by using the comitative.

This should certainly sound familiar, since reducing the topicality of an argument is exactly what a grammatical voice change does. The only difference is that the comitative reduces the topicality of only a **part** of the subject. In spite of this, it is still a grammatical voice change.

Now that we've discussed the semantics of the comitative case role, let's see how we can implement it. At first sight, it seems that we have several options:

Option 1: We can create A/P, AP/F, and P/F verbs with the general meaning 'to do with/be with/accompany' and derive case tags from them. The problem with this approach is that it is far too precise, since these case tags imply strong links to an argument of the main verb, and they precisely state whether they are static or dynamic. Thus, using this approach, we would have to create several "-s" and "-d" versions, even though natural language case markers are rarely, if ever, so precise.

Option 2: We can create a 0/F verb using the same root as is used in the P/F-s verb 'to be with'. The case tag version of this verb would have the same range of role coverage as the comitative function of most natural languages, including English. However, it fails to capture the semantics correctly. Consider the following:

        He weeded the garden with his wife.
        = He weeded the garden 'being with' his wife.

The 0/F case tag simply states that his wife was present - it does **not** indicate that she also did some of the weeding. Note that this objection also applies to option 1.

Option 3: We can insist that coordination be used instead of a case tag. Thus, the language would not allow a sentence like "He weeded the garden with his wife". Instead, it would have to be stated as "He and his wife weeded the garden". We could also create a conjunction that intentionally implies a certain degree of subordination, as in "He and-to-a-lesser-degree his wife weeded the garden". However, a conjunction does not reduce the topicality of an argument, and I know of no natural language that does this.

Option 4: We could use the secondary agent, agent-patient, patient, and focus case tags which we derived earlier. However, this solution is not correct because these are **secondary** case roles, and the roles they indicate may not be the same as the primary case roles. For example, as we saw when we discussed the beneficiary case role, a secondary patient may be somehow affected by the event, but not in the same way as the primary patient.

Option 5: Thus, what we really need is a **primary** case role; i.e., one that indicates the same role as the subject of the verb. Consider the following sentence:

        She died in the plane crash with three other passengers.

Here, the comitative entities "three other passengers" experienced exactly the same fate as the subject. Compare this with the beneficiary case role discussed earlier, where the secondary patient does **not** experience the same effect as the primary patient.

Since the comitative is actually a grammatical voice change, the only correct way to implement it is by creating a new suffix that demotes a PART of the subject and makes it oblique. We will call this voice change the 'cosubject' voice:

        cosubject     -si     demotes part of the subject and makes it
                                        obliquely expressable

Thus, the comitative case tag will be "masi". \[Incidentally, the anti-middle form "masisoy" means 'along', as in "We went along for the fun".\]

We will also need a voice-changing morpheme to indicate that an entity is specifically being **excluded** as a possible subject. The corresponding case tag will have the meaning 'without':

        non-subject   -kay     an entity is specifically excluded from
                                        being subject

Thus, the case tag meaning 'without' or 'except (for)' is "makay".

Now, marking the verb is also useful even if the demoted entity is **not** being expressed obliquely. In this case, the marked verb would imply that it has a cosubject even though the cosubject is not being expressed. In effect, if "-si" is suffixed to the verb and its argument is not expressed obliquely, it indicates that the subject was not by himself or on his own; i.e., there is a cosubject but it is not being specified. On the other hand, if "-kay" is used this way, it implies that the subject **was** by himself or on his own; i.e., it emphasizes the fact that there **is** no cosubject. Here are some examples using the verb "canzanvyu" meaning 'to open':

        John canzanvyu the door.
        = John opened the door.

        John canzanvyusi the door.
        = John opened the door with one or more unspecified others.
        = John did NOT open the door alone/by himself/on his own.

        John canzanvyukay the door.
        = John opened the door without one or more unspecified others.
        = John opened the door alone/by himself/on his own.

Now, when we apply a passive voice change to a verb, the appropriate passive suffix must appear on the verb even if the demoted argument is expressed obliquely. For example:

        The door canzanvyuvo = The door was opened.
        The door canzanvyuvo mavo John = The door was opened by John.

For the cosubject and non-subject case tags, however, the suffix must **not** be used on the verb if it is also expressed obliquely. The reason for this is that parsing will be simpler since the verb will be marked only if its argument structure changes. (When a passive suffix is added to a verb, one of its arguments is always demoted. When "-si" or "-kay" are used obliquely, the subject has **not** been demoted, and when they are applied directly to the verb, an implied argument must be automatically added by the translator.)

Also, since the verb is not marked, it's not clear which verb (actual or implied) is relevant. This allows us to use "masi" and "makay" or a derivation even if its argument is not linked to the actual subject of the verb, as in "Mother sent the children away without(=makay) candy". In this example, "makay" links "candy" to "children", **not** to the subject "mother". In other words, "the children" were without "candy", not necessarily "mother".

Finally, some languages also have comitative case tags that link to the **object** of the verb rather than to the subject (the only language I specifically know of that can do this is Mayali, Gunwinyguan family, Australia). English can do this occasionally, but only when the semantics and context make it impossible to interpret a link with the subject, as in "Bob sent her some flowers yesterday **with** a get-well card". Since this usage is quite rare, we will not create a unique suffix for it. (In fact, in my dialect of English, this usage sounds distinctly "odd", and can be just as easily implemented as "flowers AND a get-well card".) <span id="S4_3_4"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 4.3.4 Location

Most languages, including English, have several verbs that are inherently locative in nature, such as "to enclose", "to enter", "to arrive", "to exit", "to put", "to lower", etc. All of these words can be derived from roots that will also be useful in the derivation of locative case tags and many other useful verbs, adverbs, and adjectives. For example, "to raise" is the A/P-d verb formed from the root meaning 'up (unfocused)' or 'above (focused)'; i.e., 'agent causes patient to become above an unspecified focus'. This root concept of 'up/above' can also be used to create the words meaning 'to rise', 'above', 'up', 'upwards', and so on. <span id="at_in"></span>

To illustrate this process, let's start with the basic state concept meaning 'located at/in' and try to derive as many useful words as possible from it. For this illustration, we will use the root "pyo". \[Note that "pyo" is actually a root-terminator.\] Here is an example of a standard paraphrase of the English preposition "at":

        John studied law at Harvard.
        = In the event in which John studied law, he was at Harvard.

And here are some of the words we can create using this concept ("pyo" will be a P/F-s case tag by default):

        pyo = P/F-s case tag = 'at/in'
                e.g. John works pyo Boston = John works in Boston.

        pyoda = P/F-s verb = 'to be located at/in'
                e.g. John pyoda the reservoir
                     = John is at the reservoir.

        pyokwedi = inverse F/P-s noun = 'location/position'
                e.g. Its pyokwedi is a secret = Its location is a
                        secret.

        pyovoy = P-s [+F] adverb = 'someplace', 'somewhere',
                        'at/in some unspecified place'
                e.g. He lost it pyovoy = He lost it somewhere.
            [Note that "part-of-speech suffix "de" is not needed here
                because "pyo" is an adverb/case tag by default and "voy"
                does not change it.]

        pyosu = P/F-d verb = 'to become located at', 'to get to/into'
                e.g. How did the table pyosu the other room?
                     = How did the table get into the other room?

        pyosude = P/F-d case tag = 'to', 'on the way to'
                e.g. He ran pyosude the house = He ran to the house.
                     He sang on the way to work.

        pyosuvoyde = P-d [+F] adverb = 'someplace', 'somewhere',
                        '(in)to some unspecified place'
                e.g. They moved it pyosuvoyde = They moved it somewhere.

It's important to emphasize that "pyo" is very general and that the focus of "pyo" must be an actual location. Also, many true locatives imply their immediate surroundings. Because of this, "John pyoda the lake" will be translated as "John is AT the lake" simply because a "lake" is normally associated with its immediate surroundings. It is certainly possible that John is also IN or ON the lake, but these interpretations inherently exclude the surroundings. Thus, for true locatives, we must always use the English preposition that is the most general for the location, even if a more specific preposition is more prototypical. This means that, for English, we will always use "at" unless the result is awkward or ungrammatical. Here are some examples:

        AT the cave/river/reservoir/dam/school/commune/swamp/
                house/shopping mall/island/planet/wharf/beach/
                farm
        IN the forest/garden/city/desert/room/suburb
        ON the patio/campus/road/continent/balcony/stage

Now, the above rule applies only to foci that are true locatives. For a focus that is not a true locative, "pyo" will always mean that the patient and the focus are in the same general location. Here are some examples:

        NEAR the refrigerator/chair/flagpole/car/tent/door
        WITH the books/hooks/choir/scissors/salt/dog/boy

Note that "near" is used for all large, non-living items, while "with" is used for everything else.

Now, if we had a way to negate the meaning of the root, we could create words with meanings such as 'to be not-at = to be away from', 'to become not-at = to get away from', and so on. To accomplish this, the interlingua has the antonymic locative classifier "-moy" which will be used to create contrasting pairs such as "at/away from", "above/below", "north of/south of", "to the right of/to the left of", and so on. "Pyo" will be used for the more basic, positive, or highest magnitude sense, while "moy" will be used for the non-basic, more negative, or lowest magnitude sense. With this new morpheme, we can now derive several more useful words:

        moy = P/F-s case tag = 'not at/in/etc', 'away from'
                e.g. John attends school moy his home town
                        = John attends school away from his home town.

        moyda = P/F-s verb = 'to be not located at/in/etc', 'to be
                        away from'
                e.g. John moyda Boston
                        = John is away from Boston.

        moyvoy = P-s [+F] adverb = 'away', '(at) elsewhere', '(at)
                        somewhere else', '(at) someplace else'
                e.g. They found it moyvoy
                        = They found it somewhere else.

        moysu = P/F-d verb = 'to become located away from', 'to get
                                        away from'
                e.g. The boat moysu the wharf
                        = The boat got away from the wharf.

        moysude = P/F-d case tag = 'from', 'away from' (source
                                                location)
                e.g. I sent it moysude Boston
                        = I sent it from Boston.
                     He ran moysude the house
                        = He ran (away) from the house.

        moysuvoyde = P-d [+F] adverb = 'away', '(to) elsewhere',
                        '(to) somewhere else', '(to) someplace else'
                e.g. They chased the dog moysuvoyde
                        = They chased the dog away.
                     He moved the papers moysuvoyde
                        = He moved the papers somewhere else.

Note that the following useful words can also be derived from the root "pyo", even though they are not needed to form case tags that represent English prepositions:

        A/P/F-d:
            pyovu = 'to move to', 'to put/place at/in'
                e.g. We pyovu the barrels the backyard.
                     = We moved the barrels to the backyard.
            moyvu = 'to move away from', 'to remove from'
                e.g. We moyvu the books the shelves.
                     = We removed the books from the shelves.

        A/P-d:
            pyovyu = 'to move', 'to place', 'to position', 'to deposit'
                e.g. Who pyovyu the desk?
                     = Who moved the desk?
            moyvyu = 'to remove', 'to move away'
                e.g. Joey moyvyu the old TV yesterday.
                     = Joey removed the old TV yesterday.

        AP/F-d:
            pyoku = 'to arrive at/in', 'to reach'
                e.g. We pyoku Atlanta yesterday.
                     = We arrived in Atlanta yesterday.
            inverse "pyokukwedi" = 'destination', 'goal'

            moyku = 'to leave/depart (transitive)', 'to go (away) from
            e.g. She just moyku the meeting.
                 = She just left the meeting.

        AP-d:
            pyokusoy = 'to arrive' (intransitive)
                e.g. They pyokusoy yesterday.
                     = They arrived yesterday.

            moykusoy = 'to leave', 'to go away', 'to depart',
                'to go out/off', 'to head out', 'to take one's leave'
                (intransitive)
                e.g. We moykusoy every day at noon.
                     = We headed out every day at noon.

        A/P/F-s:
            pyova = 'to keep at/in'
                e.g. She pyova the stallion the pasture.
                     = She keeps the stallion in the pasture.
            moyva = 'to keep away from'
                e.g. I moyva the dogs the chicken coop.
                     = I keep the dogs away from the chicken coop.

        A/P-s:
            pyovya = 'to constrain', 'to keep in (place)', 'to limit/
                        restrict movement of'
                e.g. We pyovya the larger dog.
                     = We restrict the movement of the larger dog.
            moyvya = 'to keep away/out', 'to hold at bay'
                e.g. He moyvya the mosquitos with a net.
                     = He keeps the mosquitos away with a net.

        AP/F-s:
            pyoka = 'to attend', 'to stay/remain at/in'
                e.g. I pyoka the conference for three days.
                     = I'm attending the conference for three days.

            moyka = 'to stay or remain away from', 'to avoid'
                e.g. Bill moyka school
                     = Bill is staying away from school.

        AP-s:
            pyokasoy = 'to stay put', 'to stay/remain in place',
                                'to stay behind', 'to abide'
                e.g. I told the children to pyokasoy.
                     = I told the children to stay put.
            moykasoy = 'to stay out', 'to stay away'
                e.g. He moykasoy until sunrise.
                     = He's staying out until sunrise.

Note that in many of the English versions of the focused verbs, the focus is oblique (e.g. "to stay AT"). Thus, if we want to precisely emulate English, we will need to create and use the more verbose \[+F\] versions. However, this is really not necessary because English makes little (if any) distinction between the topicality of objects and the topicality of obliques.

Finally, the above derivations are just examples using a **single** locative state concept. A language will need many other locative case tags. These tags will describe all of the possible states and relationships that are dealt with by English prepositions and adverbs, and will have such meanings as 'to be above', 'to be behind', 'to be inside', etc. In turn, these roots can be used to create many other useful words. For example, the root used to form the locative verb meaning 'to be inside' can also be used to create the oblique case tag 'inside of', the adverb 'inside', and other useful words such as English "to enter", "to insert", "inwards", "interior", "contain", and so on, along with all of their opposites. <span id="S4_3_5"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 4.3.5 Time

Temporal case tags indicate the locus of an event in time. Consider the following examples:

        John bought the book IN March.
        We visited them WHEN we were in New York.
        They built the doghouse OVER the weekend.
        He lost weight SINCE the accident.
        She won't leave UNTIL she sees the boss.
        We met Janice DURING/ON our last visit.
        He plans to leave AT noon.
        I'll take a shower BEFORE I leave.

Note that some English temporal case tags (e.g. "in", "over", and, "at") also have locative meanings, while others (e.g. "when", "since", and "until") have only temporal meanings. There are also locative case tags in English that are never used with temporal meanings (e.g. "along", "beneath", "against", "via").

One possible solution to the problem of creating temporal case tags would be to simply use locative case tags with temporal arguments. It is important to keep in mind, though, that different languages assign temporal meanings to locative case tags in different ways, if at all.

However, overloading locative case tags is semantically incorrect for the simple reason that locative and temporal case tags have very different meanings.

Thus, we will have to create verbs with meanings such as 'to happen at', 'to happen after', 'to happen during', etc. Note that we can also state these verbs in terms of a position on a timeline, such as 'to be at a time locus during/after/etc'. Here is an example using our standard form of paraphrasing:

        John bought the car before he got married.
        = In the event in which John bought the car, the time locus
                was before he got married.

Now, let's do a few sample derivations using the concept of 'before'. For these derivations, we will use the root "pa", which, as we will see [later](#S15_1), is actually a root-terminator and a marker for past tense. It is P/F-s by default, but it is **not** a case tag by default. Here are some of the more useful derivations:

        pada = P/F-s verb = 'to be (at a point in time) before',
                        'to precede', 'to happen/occur before'
                e.g. The accident pada the election.
                        = The accident preceded the election.

        pade = P/F-s case tag = 'before', 'by the time (of)', 'prior
                        to'
                e.g. John got drunk pade the party started.
                        = John got drunk before the party started.

        pasoyde = P-s [-F] adverb = 'earlier', 'previously'

        pasoydo = P-s [-F] adjective = 'earlier', 'previous', 'preceding',
                        'prior'

        [Note that we cannot use "pado" in place of "pasoydo", since it would
        imply that the referent time is not known from context.  Because of
        this, I doubt that "pado" will be useful.]

We'll see many more derivations in the chapter on [Tense and Aspect](#S15_0).

The above derivations are just examples using a **single** temporal state concept. A language will need several other temporal case tags. These tags will describe all of the possible states and relationships that are dealt with by English prepositions and adverbs, and will represent such concepts as 'time after', 'time at', 'duration', 'repetition', etc. However, since time is one-dimensional, we won't need nearly as many temporal case tags as locative ones. Later, when we discuss [Tense and Aspect](#S15_0), we will see how the roots for **all** temporal case tags can be effectively "derived". <span id="S4_3_6"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 4.3.6 Reason

Many things happen as a result of earlier events, conditions, or situations. In English, these events are normally introduced by expressions such as "because", "because of", "in that", "as a consequence of", "(out) of", "from", etc. Here are some examples:

        John left early BECAUSE he had a headache.
        They guarded it carefully BECAUSE OF its great value.
        The book provides a useful resource, IN THAT it lists
            every restaurant a tourist should avoid.
        He was not allowed to participate AS A CONSEQUENCE OF his
            past behavior.
        He died OF/FROM a broken heart.
        They agreed to the terms OUT OF fear of retaliation.

Note that some English forms are used exclusively with embedded clauses (i.e. "because" and "in that"), while the others require noun phrase arguments (i.e. "because of", "as a consequence of", "(out) of", and "from").

Since this case role represents the most basic form of indirect causation, we can paraphrase it as follows:

        John left early because of a headache.
        = In the event in which John left early, the indirect cause
                was a headache.

Since this is the most generic kind of indirect causation, the obvious solution is to use the true generic root "ma" plus the 0/A suffix "-ve". Thus, the reason case tag is simply "mave". In effect, the argument of "mave" is the secondary agent of the event. <span id="S4_3_7"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 4.3.7 Manner

The manner case tag describes **how** something happens. It can be paraphrased as "in the manner of" or "in an X manner", and answers the question "how did such-and-such occur". English implements the manner case using prepositions and adverbs. Here are some examples:

        He drove the car LIKE a madman. (preposition)
        He QUIETLY closed the door.     (adverb)

We've already seen how to convert verbs to adverbs, some of which function like English manner adverbs. There are times, however, when manner cannot be indicated with a simple adverb, as in the following examples (manner case tags are capitalized):

        The army raced through the town LIKE a destructive tidal wave.
        Their singing sounds LIKE wailing banshees.
        The preacher berated the congregation AS IF they were naughty
                children.

Most manner case roles are indicated in English with the preposition "like". However, even here, we have two distinct senses. Consider the following:

        He drove the truck LIKE a tank.
        He drove the truck LIKE a madman.

In the first sentence, the word "like" describes the behavior of the patient. In the second sentence, it describes the behavior of the agent. Also, the first sentence itself has two distinct interpretations:

        He drove the truck causing it to be like a tank.
        He drove the truck as if it were a tank.

<span id="cituda"></span>

The best way to capture these distinctions as accurately as possible is to create case tags from a root morpheme meaning 'like' or 'similar'. In the interlingua, we will assign the root "citu" (default = P/F-s). The three verb derivations that are most useful here are as follows:

        P/F-s:      cituda         'to be similar to', 'to resemble', 'to
                                    be like', 'to have the appearance of
                                    being'

        AP/F-s:     cituka         'to act similar to', 'to imitate'

        A/F-s [-P]: cituvasoy      'to cause something known from context
                                    to be similar to', 'to approximate'

When converted to case tags, these three verbs will provide the needed semantics for the above manner expressions: "like a tank", "like a madman", "like a destructive tidal wave", "like wailing banshees" and "as if they were naughty children". In the last item, "as if they were naughty children" would be expressed as "like naughty children" where "like" would be implemented using the P/F-s form "citude".

Now, while the above three derivations are semantically precise, some people may object to having to learn three case tags instead of just one. In a situation like this, it may be advisable to use the non-specific 0/F suffix "-swa", discussed [earlier](#S4_1_1), plus the root meaning 'similar'. Using this approach, the single, all-purpose, manner case tag will be "cituswa". <span id="S4_3_8"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 4.3.8 Case Tags for Exchange Verbs

In the chapter on verb semantics, we discussed the need for the [additional case roles](#transfer_verbs) of secondary agent-patient and secondary focus in sentences such as:

        John sold the book to Bill for five dollars.

Here, "John" is the primary agent-patient, "the book" is the primary focus, "Bill" is the secondary agent-patient, and "five dollars" is the secondary focus.

These are secondary roles because they do **not** play the same roles as the corresponding roles for the main verb, but they DO take part in the change of possession.

Thus, both secondary roles can be derived in exactly the same way as the [secondary patient (i.e. beneficiary)](#S4_3_2) that we discussed earlier, by applying the appropriate non-linking suffix directly to the true generic root "ma". In other words, the secondary agent-patient (0/AP) meaning 'to/from' is "make", and the secondary focus (0/F) meaning 'for' is "maswa".

English uses two separate case tags to indicate the secondary agent-patient, depending on the direction of transfer. These are "to" and "from", and are often referred to as *recipient* and *donor*, respectively. However, there is really no need to implement two case tags, since the verb always indicates the direction of transfer. For example, in the following sentences, it's obvious who is the donor and who is the recipient:

        John sold the book "to or from" Bill.
        Bill bought the book "to or from" John.

And for verbs like "swap", we use the more neutral preposition "with" for the secondary agent-patient:

        John swapped his book for a magazine WITH Bill.

Thus, there is no need to implement two case tags for the "to/from" roles. Whenever there is a change of possession, the role indicated by the English prepositions "to", "from", and "with" is always specified by the verb, and using the case tag to indicate the direction of transfer is simply redundant.

The secondary focus uses the same English preposition "for", **regardless** of the direction of transfer, as in:

        He sold the bike FOR $50.
        He bought the bike FOR $50.
        He swapped the book FOR a magazine.

A secondary agent-patient can also be used when a non-physical transfer occurs. Here are some examples:

        I found out about the party FROM Bill.
        He deduced the location FROM the clues that you provided.

While the second example is somewhat metaphorical, it's still a legitimate use of the secondary agent-patient case tag. <span id="S4_3_9"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 4.3.9 State

Many verbs allow an expression that provides more information about the final state of the patient. Here are some examples:

        He drilled the board FULL OF HOLES.
        He sliced the meat INTO SMALL PIECES.
        The coach turned back INTO A PUMPKIN.
        The crowd shouted itself HOARSE
        The crowd shouted itself INTO A FRENZY.

Linguists call these constructions *resultatives*. It's also possible, though, to specify initial states:

        He changed FROM A SOFT-SPOKEN LIBERAL to a religious fanatic.
        He built the doghouse OUT OF SCRAP LUMBER.
        He worked the gold FROM AN INGOT into a flat sheet.

It's also possible (although rare) to specify a steady-state. Compare the following two sentences:

        He kicked the door OPEN.  (change-of-state)
        He held the door OPEN.    (steady-state)

In English, most steady-states are handled with adverbs, as in the following examples:

        They GLADLY tagged along.
        He QUIETLY ignored his brother.
        She imitated her boss CONVINCINGLY.
        The lights are flashing RAPIDLY.

Colors, though, are typically used in their adjective forms for both steady-states and changes-of-state:

        The lights glowed red and blue.  (steady-state)
        He painted the door green.       (change-of-state)

Thus, in English, initial states are introduced by the prepositions "from" or "out of". Final states which are represented by noun phrases use the prepositions "in" or "into". States which are represented by adjectives do not use any case role marker. Steady-states use either adjectives (rarely) or adverbs (frequently). <span id="to_be"></span>

All of these situations can be dealt with quite easily in the current framework. For the manner case role, we introduced the verb "to be similar to" and its derivatives. For the state case role, we will need a verb meaning 'to be equal to', or 'to be the same as', or simply 'to be'. In the interlingua, we will use the root "ziza" to represent this concept (default = P/F-s verb). Thus, the case tags are:

        P/F-d:  zizasude = English "to/into"
                    (literally "becoming the same as")
                buzizasude = English "from/out of"
                    (literally "becoming not the same as")

Also, note that the P/F-s verb "zizada" is equivalent to the English copula "to be". However, since the concept of 'being' is an inherent feature of all of our P-s verbs, adjectives, and basic nouns, this verb will not be needed in the interlingua as often as it is in English. Here are some examples:

        The food cabida = The food is wet.
          where "cabida" is the P-s verb meaning 'to be wet'

        Joey caxayda = Joey is a mosquito.
          where "caxayda" is the P-s verb meaning 'to be a mosquito'

However, the verb "zizada" can still be useful when emphasis is needed or when either noun needs modification.

\[Incidentally, the sentence "The food zizada cabidi" literally means 'The food is the wet one'. In the interlingua, an adjective can never be an argument of a verb. Thus, to get the meaning 'The food is wet', we **must** use "The food cabida".\]

Where English uses adjectives or adverbs, we will use the adverb form of the appropriate P-s or P-d verb. For example, in a sentence such as "He painted the door green", we would use the P-d adverb form of the root meaning 'green'. Literally, this would mean something like 'He painted the door, it becoming green'.

Finally, do not confuse state case roles with the focus case role. Consider the following:

        Louise ran the marathon.
        Louise sang an aria.

In both examples, the object is a focus. If it were a state, it would describe the state of Louise. In other words, it would indicate that Louise **was** a marathon or an aria. However, neither "marathon" nor "aria" describe the state of a patient - instead, they elaborate the events. <span id="S4_4"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 4.4 Summary of Case Tag Forms

In the preceding sections, we derived several case tags. Here is a list that allows us to compare their various forms:

Primary case roles:

        Passive                 ->  mavo    passive + true generic
        Anti-passive            ->  mavoy   anti-passive + true generic
        Comitative ('with')     ->  masi    cosubject + true generic
        Non-subject ('without') ->  makay   non-subject + true generic

Secondary generic case roles:

        Secondary Agent          -> mave   true generic + 0/A
          = Reason 'because (of)'
        Secondary Agent-patient  -> make   true generic + 0/AP
          = Exchange 'to/from/with'
        Secondary Patient        -> mase   true generic + 0/P
          = Beneficiary 'for'
        Secondary Focus          -> maswa  true generic + 0/F
          = Exchange 'for'

Secondary non-generic case roles:

        Instrument/Means/Method
            'by/with/via/etc'   ->  guswa        root + 0/F
        Locative 'at/in'        ->  pyo          root (P/F-s)
        Locative 'to'           ->  pyosude      root + P/F-d
        Locative 'from'         ->  moysude      neg + root + P/F-d
        Temporal 'before'       ->  pade         root (P/F-s)
        Manner 'like'           ->  cituswa      root + 0/F
        State 'into'            ->  zizasude     root + P/F-d
        State 'from'            ->  buzizasude   neg + root + P/F-d

<span id="S4_5"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 4.5 Additional Uses of the Focus Case Role

For verbs describing relational states, the focus case role indicates the referent of the verb. This referent is always obvious and needs no further explanation. For verbs describing physical states, however, the focus is not always obvious. In fact, many physical verbs do not appear to have a focus at all. As we will see, though, **all** verbs can have a focus. For many, though, the focus is so strongly implied by the meaning of the verb that expressing it obliquely or as a direct object would be redundant.

Before we try to deal with verbs that seem to be inherently unfocused, let's first re-examine the semantics of focus in more obvious situations. Remember, for a focused state verb, the patient experiences a steady-state or undergoes a change of state **in its relationship with the focus**. For example:

        1. John needs money.
        2. John owns the house.
        3. John bought the house.

In (1), we are describing a relationship between "John" and "money". The relationship is defined by the state concept "need". In (2) and (3), we are describing a relationship between "John" and "the house". The relationship is defined by the state concept "ownership", where (2) describes a steady-state and (3) describes a change of state (number 3 also implies the use of money as a secondary focus). Thus, there is a relationship between the patient of the verb and the focus. Let's extend this idea to some simple static verbs:

        I'm angry "focus" Louise.
        = I'm angry at Louise.

        The house is free "focus" termites.
        = The house is free of/from termites.

        The little girl is afraid "focus" thunder.
        = The little girl is afraid of thunder.

        John is proud "focus" his father.
        = John is proud of his father.

        John is happy "focus" Louise.
        = John is happy for/about Louise.

Note that the above examples can be expressed either as P/F-s verbs where the focus is the direct object, or as P-s \[+F\] verbs with an oblique focus. Thus, all of the English examples above are inherently anti-passive.

Do not make the mistake of analyzing the above foci as reasons or indirect causes. For example, the sentence "The girl is afraid OF thunder" does **not** mean the same as "The girl is afraid BECAUSE OF thunder". <span id="focus_scalars"></span>

The above examples use verbs that are inherently relational. For verbs that represent non-relational **scalar** states, the focus can elaborate the actual position on a scale of possibilities:

        John is wealthy "focus" $1,000,000.
        = John is wealthy to the tune of $1,000,000.

        John is tall "focus" 6 feet.
        = John is 6 feet tall.

        The box is heavy "focus" 10 kilograms.
        = The box weighs 10 kilograms.

        The new student is intelligent "focus" 160.
        = The new student has an intelligence (IQ) of 160.

        The painting is expensive "focus" 100 dollars.
        = The painting costs 100 dollars.

In other words, the focus of scalar states elaborates the degree of the state.

We can also create examples where the focus is abstract:

        He formatted the document "focus" company standards.
        = He formatted the document according to company standards.

In other words, the document is in a relationship with a company standard, and the nature of the relationship is indicated by the verb "format". For some verbs, though, the focus is so strongly implied that expressing it separately seems redundant:

        The recession impoverished his family (?of money).
        The cat killed the mouse (?of life).
        The boys broke the window (?of its structure).

We should be able to apply the same logic to specify a focus for verbs that, on first examination, appear to be inherently unfocusable, even if the result is redundant. For example, what could the focus be in the following sentence:

        John managed the company.  (A/P-s)

When something is managed, it has operations or other components that can be controlled:

        John managed the company (?in its operations).

However, if the focus adds detail that is not implied by the verb, then a specific focus is not only acceptable but very useful:

        John managed the company in its overseas operations.

Now, consider the following:

        The warrior struck the peasant. (A/P-d)

Again, we can focus the action only if it provides more detail, as in:

        The warrior struck the peasant a mighty blow to the head.
            (A/P/F-d)

In other words, the focus of an action is a more detailed description of the action itself. Note that this is exactly what happens with speech acts, where the focus describes the actual message being conveyed (e.g. "John told the kids A STORY").

Thus, for some verbs, the focus is an inherent part of the meaning of the verb; i.e., it is *lexicalized*. A specific focus only makes sense if it provides more detailed information.

Finally, there are indeed concepts that are inherently unfocusable. However, these are not true state or action concepts, and will not be derived as basic verbs. We'll have more to say about them later, when we discuss [Deixis](#S10_0). <span id="S5_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 5.0 Open Arguments and Modifiers

Since verbs can be converted to oblique case tags and adverbs, why not apply the same logic to create the equivalent of English non-modifying prepositional phrases (e.g. "the man WITH THE RED HAT") or adjective phrases (e.g. "countries RICH IN OIL")?

By its very nature, a verb has arguments. When other parts-of-speech are derived from verb forms, the results can also have arguments. For example, an adverb is an oblique argument of a verb but takes no additional arguments of its own. A case tag, however, operates in the same way while adding one or two new arguments to the verb. In effect, a case tag is an *open* verb argument, since its non-subject arguments are available for use. An adverb, however, is a *closed* verb argument, since it cannot take any more arguments of its own.

The same distinction can be made with other parts-of-speech that are derived from verbs. For example, the nouns and adjectives that we've seen so far are all closed, since they take no arguments of their own. In this section, we will discuss what happens when we 'open them up'.

In order to do this, though, we first need to summarize what we've done so far, and introduce a few new concepts:

        1. The part-of-speech of a word in the interlingua is either the
        default for the root or is indicated by a suffix.  The following
        morphemes at the end of a word indicate the part-of-speech:

            -da  = verb
            -de  = case tag or adverb
            -di  = noun
            -do  = adjective
            -day = previous-word modifier (see below; e.g. adverbs that
                        modify adjectives)

        2. By definition, verbs and case tags are inherently open.  Nouns,
        adjectives, and previous-word modifiers are inherently closed.

        3. Three new part-of-speech suffixes will be assigned that will
        open the argument structure of a normally closed word:

            -du  = open adjective
            -daw = open noun
            -dwe = open previous-word modifier

        4. An appropriate grammatical voice operation can be performed
        to close the argument structure of words that are inherently
        open.

Note that rule (1) introduces a new part-of-speech indicated by "-day". Words with this suffix will always modify the immediately preceding word, regardless of its part-of-speech. Thus, they can be used to implement English adverbs that modify adjectives (e.g. "RECENTLY married couple", "RAPIDLY flowing stream", etc.).

Previous-word modifiers can also be used to modify adverbs, case tags, and other previous-word modifiers.

Rule (2) is nothing new and simply re-iterates and formalizes what we've been doing all along.

Rule (3) can be used to create nouns, adjectives, and previous-word modifiers that take arguments. I will illustrate how to do this below.

Rule (4) simply re-iterates something we already know. That is, we can apply grammatical voice operations to remove one or more arguments from a verb, effectively closing it. This will allow us to create adverbs that do **not** take arguments of their own from verbs that normally take objects. For example, middle forms can be used to create adverbs such as "unexpectedly", "repeatedly", "amusedly", etc. Anti-middle forms can be used to create adverbs with meanings such as "destructively", "lovingly", "oppressively", "knowingly", and so on. <span id="S5_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 5.1 Open Adjectives

By opening up the argument structure of adjectives, we can create words that represent the functions of many English prepositions. Consider the following examples:

        the cup ON the table            ("on"     = 'being located on')
        the circus AT the fairgrounds   ("at"     = 'being located at')
        the can OF beans                ("of"     = 'containing')
        the magazine UNDER the box      ("under"  = 'being under')
        the pile OF junk                ("of"     = 'consisting of')
        the pound OF beef               ("of"     = 'consisting of'
        the building ACROSS the street  ("across" = 'being across')
        the paper BY Smith              ("by"     = 'having Smith as agent')

Note that all of the above (except the agentive "by") must use the P/F-s forms of the corresponding verb.

Each open adjective will link the noun it modifies with the argument of the adjective. Here are a few derivations using morphemes we've already defined:

        agent   ->  mavedu        e.g. the book by Mark Twain
        reason  ->  mavedu        e.g. the delay mavedu Joe
                                      = the delay caused by Joe
        with    ->  makaydu       e.g. the boy with those two women
        for     ->  masedu        e.g. the party for Jill
        at/in   ->  pyodu         e.g. the man at the corner
        before  ->  padu          e.g. the day before the party
        method  ->  guswadu       e.g. death by strangling
        state   ->  buzizasudu   e.g. the hut buzizasudu straw
                                      = the hut made (out) of straw

And so on. Note that verbs that have had their argument structure inverted (with a voice-changing morpheme) can also be converted to open adjectives. This would allow you to handle distinctions such as (active) "the man owning the house" vs. (inverse) "the house belonging to the man" or (passive) "the house owned by the man". <span id="about"></span>

The general scalar relationship classifier "tu" can be used with the very general sense 'having an unspecified relationship with' or 'having something to do with'. Keep in mind that interpretations of "tu" can be different depending on context, since the generic root morpheme does not indicate a specific relationship. Out of context, an accurate paraphrase of "the article tudu the election" would be "the article having something to do with the election". Thus, a likely translation would be "the article ABOUT the election". Other examples are "the recipe FOR cake" and "a big book OF jokes". Note that English also allows these to be expressed as vague noun-noun compounds: "election article", "cake recipe", and "joke book".

In fact, the open adjective "tudu" can often be used in place of other, more specific, open adjectives, although the result will be vaguer. For example, "the letter tudu Louise" means literally 'the letter associated with Louise'. Thus, a closer English gloss would be simply "the Louise letter", since it can mean 'the letter to Louise', 'the letter from Louise', 'the letter with Louise', 'the letter about Louise', and so on. Because of this vagueness, it will be useful in machine translation when the software cannot tell the difference between the very general 'associative' sense and a more precise genitive sense (which we will discuss in the next section).

Since the derivation of open adjectives is essentially the same as the derivation of case tags, I won't spend much more time on it here. In general, most case tags will have adjective counterparts, especially the locative ones. Also, keep in mind that different languages implement these functions in different ways. For example, in many languages, they are neither adpositions nor inflections, but are implemented as relative clauses (e.g. "the boy in the kitchen" = "the boy who is in the kitchen").

Also, a few languages, such as English, allow some case tags to be used, unmodified, as open adjectives. However, this is not allowed in the interlingua because case tags and open adjectives are both syntactically and semantically distinct, and because conflating them would often result in attachment ambiguities. For example, in the sentence "I spoke with the lady in the storeroom", is "in the storeroom" an oblique argument of "spoke" or a modifier of "the lady"? Besides, natural languages that use the same word for both roles, including English, often do so idiosyncratically. Consider the following:

        I put the box UNDER the bed.
        The box UNDER the bed is empty.

        The man walked INTO the room.
        *The man INTO the room is my brother.
        The man WHO WALKED/WENT INTO the room is my brother.

        He built the doghouse OUT OF plywood.
        *The doghouse OUT OF plywood is as good as the plastic one.
        The doghouse MADE OF plywood is as good as the plastic one.

        They delayed the operation BECAUSE OF his death.
        ?The delay BECAUSE OF his death was unavoidable.
        The delay CAUSED BY/DUE TO his death was unavoidable.

In other words, sometimes the case tag is the same as the open adjective, while other times it is not. When it is not the same, it is either periphrastic or idiosyncratic. The system used here is totally regular and unambiguous. <span id="S5_1_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 5.1.1 The Genitive

English has two ways to implement the genitive (also called the \_possessive\_): use of apostrophe-s or use of the preposition "of". Here are some examples:

        Definite argument:
            the boat of the student  = the student's boat
            the boat of the students = the students' boat

        Indefinite argument:
            the boat of a student  OR  a boat of a student
                    = a student's boat
            the boat of some students  OR  a boat of some students
                    = some students' boat

Note that the English apostrophe-s form is sometimes ambiguous, as in the last two examples above. However, there are times when we cannot use an apostrophe-s form at all, as in "a boat of the student". In other words, the apostrophe-s form can be used only if the headword is definite or if the definiteness of the headword is the same as the definiteness of the noun following "of". If this is not true, then the "of" form must be used in English.

Now, consider the following:

        I put the new computer in the room of computers
        = I put the new computer in the computer room.

In the above example, "computers" is a generic noun and the "of" form is too unnatural for fluent use. Even the apostrophe-s form would sound unnatural in most situations. Instead, to correctly capture the semantics and to sound more natural, we must use a noun-noun compound. \[We'll see later how to implement [generic nouns](#generic) and [compounds](#S22_0).\]

In the interlingua, the genitive concept is represented by the root-terminator "po". By default, "po" is an F/P-s open adjective. Here are some examples:

        the tail me bird = the bird's tail
        the book me John = John's book
        the answers me the students = the students' answers

Note that the default argument structure of "po" is actually the **inverse** of an active P/F-s structure, because a genitive sense inverts the normal P/F-s possessive sense. For example, the noun phrase "John's book" implies that John has the book, and the concept 'have' is inherently P/F-s. \[We have chosen this somewhat odd default for its usefulness. And, as we will see [later](#S18_0) , it will have a very important additional use.\]

As it turns out, the genitive concept almost completely overlaps the many senses of the English verb "to have". To illustrate this, consider the following examples:

        The project has a new manager           => the project's new manager
        The house has a red roof                => the house's new roof
        He has a good reputation                => his good reputation
        We had problems with the new equipment  => our problems
        John has an answer to your question     => John's answer
        I had supper at 6 o'clock               => my supper

In other words, the semantics of the verb "to have" encompasses much more semantic space than the prototypical sense of 'possession', 'ownership', or 'control'. In fact, it can even imply the exact opposite, as in:

        The slaves have a new owner.

Thus, the P/F-s verb "posa" is in almost all respects the equivalent of the English verb "to have". \[The English verb is different when it is used as an auxiliary, and when it is used with a causative sense as in "I HAD Joe sweep the garage".\] Also, the sense of the word (and its derivatives) usually defaults to 'possession' or 'control' whenever the actual relationship is not clear from context, and this default appears to be universal among natural languages. However, as we saw in the last example above, the exact opposite can also be true.

This automatically leads to the creation of several additional words:

        A/P/F-d: mevu - 'to give', 'to cause P to come to have F'

        AP/F-s:  meka - 'to keep', 'to retain'

        AP/F-d:  meku - 'to obtain/get', 'to accept', 'to take'

        P/F-s:   mesa - 'to have', 'to possess'

        P/F-d:   mesu - 'to get/receive', 'to come into/by'

Note that we used the P/F-s suffix "-sa" to convert "po" from F/P-s to P/F-s. We will **not** allow the use of the inverse suffix "-kwe", even though it is technically correct. <span id="S5_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 5.2 Open Nouns

By opening up the argument structure of nouns, we can create more complex noun phrases without having to resort to the use of prepositions, relative clauses or other subordinate constructions. Here are a few English examples:

        They hired a TERMITE EXTERMINATOR.
        BASEBALL PLAYERS get paid too much.
        I am no longer a COFFEE DRINKER.

In all of the above highlighted phrases, the second word is an open noun version of a verb and the first word is its object argument. Since we are using the noun version of a verb, and since such use represents a generic subject, the subject position is automatically filled. Thus, we can say "coffee drinker" where "coffee" is a noun (literally 'drinker of coffee'), but we cannot say "woman drinker" (literally, 'drinker of woman'), where "woman" is also a noun (although we can get the sense 'woman who is a drinker' by using the adjective version of "woman").

If we first invert a verb and then use its open noun form, the original subject position becomes available while the original object position becomes automatically filled. For example, the inverse-noun form of "to study" would correspond to the English words "subject" or "topic". If we then open it up, we can create an expression like "subject John", which would be equivalent to the English expressions "John's subject of study" or "the subject that John is studying".

Later, when we discuss prefixes in more detail, we will be able to derive process nouns from verbs, such as "destruction" from "to destroy". This will allow us to emulate English expressions such as "the destruction of the city by the enemy" without the need for prepositions. <span id="S5_3"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 5.3 Adjective Modifiers

Closed previous-word modifiers can be used to implement English adverbs that modify adjectives. Here are some English examples:

        The POORLY built homes collapsed in the earthquake.
        He emptied the PARTIALLY filled can.
        The EXTENSIVELY mined pit was an eyesore.
        QUICK-frozen vegetables taste better than canned vegetables.
        I really enjoy PROPERLY prepared seafood.

Note that the above adjective-modifying adverbs are the same as verb-modifying adverbs except that the part-of-speech suffix will be "-day" rather than "-de".

The system presented here also allows us to create **open** previous-word modifiers; i.e. words which modify adjectives, adverbs, etc. and which take an argument and link it to the preceding word. We'll see how this can be useful later. <span id="S5_4"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 5.4 Semantics of Open Nouns and Modifiers

Some readers may object to the creation of open nouns and open adjective modifiers, claiming that they are simply short cuts for subordinate clauses. This is not really true because they cannot be modified for tense, aspect, or modality. For example, consider the following:

        My beer-drinking buddies think ...

versus

        My buddies (who are) drinking beer in the corner over there
                think ...
        My buddies who shouldn't drink beer so much think ...
        My buddies who drank the beer that had gone bad think ...
        My buddies who may be drinking beer tomorrow night think ...

and so on.

In effect, the phrase "beer-drinking" says nothing about **when** the event occurred, nor does it provide additional details about **where** the event occurred, **how** it occurred, etc. In other words, an open modifier like this is more general, because it does not describe a **particular** event. \[Linguists refer to phrases such as these as *non-finite*. Phrases which are modified for tense, aspect, and modality are called *finite*.\]

It is important to keep in mind that the intent of open modifiers is to allow the creation of non-finite forms which are as efficient as possible. These constructions are **not** intended to be used as shortcuts for subordinate clauses, and, if used in such a way, translations are likely to be inaccurate.

Finally, although the argument structure of the original verb is available for use in open nouns and modifiers, keep in mind that **it is no longer a verb**. Thus, it cannot be further modified by adverbs or case tags. <span id="S6_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 6.0 Additional Prefixes and Suffixes

We've already discussed morphemes that change the argument structure of a word. In this chapter, I would like to discuss some of the other morphemes that will be needed.

As we stated earlier, we will always implement a morpheme as a prefix if it modifies the meaning of the root in a semantically precise way **without** changing its syntax. If a morpheme modifies the syntax of a word, it will be implemented as a suffix.

Here are some new prefixes: <span id="negator"></span>

        no- Negator prefix

            There are times when we will need to negate the meaning of a
            word and indicate that the referent is actually 'not' or 'other
            than' something.  We will use the prefix "no-" for this purpose.
            Here are some examples:

                    konvodo = known (adjective)
                    nokonvodo = unknown

                    cabodi = duck (noun)
                    nocabodi = non-duck

                    calodi = drinker
                    nocalodi = non-drinker

            The prefix "no-" should not be used to negate verbs.
            Instead, we will use another word for this purpose which we
            will discuss in the chapter on Modality.  For example,
            "nokonda", meaning 'to not know' is illegal.  However,
            the noun derivation "nokondi", meaning 'non-knower' and the
            passive adjective derivation "nokonvodo", meaning 'unknown',
            are acceptable.

        ne- Essential quality and ability prefix

            Use the prefix "ne-" to represent the essential and distinctive
            quality of a prototypical, generic subject.  For derivations
            from agentive verbs, the meaning will indicate some kind of
            capability or skill.  For other verbs, it will indicate the
            abstract quality associated with the subject.  In other words,
            for verbal concepts, it will indicate the attribute that a
            generic subject "has".  (Note that we are using the loose sense
            of 'have' in the interlingua word "posa", not the much stronger
            sense of the English words "possess" or "own".)  For derivations
            from nouns and adjectives, most English noun equivalents will
            end in "-ness" or "-ity", while adjective equivalents will be
            the corresponding English attributive word (e.g. "navy" ->
            "naval", "marriage" -> "marital", "reptile" -> "reptilian",
            "circle" -> "circular", and so on).

            Examples:

                "konda" = 'to know'
                    "nekondi" = 'knowledge'
                        (literally: what the subject "has")
                    "nekondo" = 'knowledgeable'
                    "nekonsodo" = 'knowable'

                "konloda" = 'to teach' (intransitive)
                    "nekonlodi" = 'teaching ability'

                "koncindi" = 'teacher'
                    "nekoncindi" = "teacherness"

                "citu" = 'like/similar to'
                    "necitudi" = 'similarity'

                "cabido" = 'wet/damp'
                    "necabidi" = 'wetness', 'dampness'

                "fido" = 'real/existent'
                    "nefidi" = 'realness/reality/existence'

                "cetawdi" = 'bird'
                    "necetawdi" = 'birdness'
                    "necetawdo" = 'avian'

                "cekundi" = 'time'
                    "necekundo" = 'temporal'

            Both nouns and adjectives can be formed from the active and
            middle voice derivations.  For example, if the P/F-s verb
            meaning 'to like/enjoy' is "jutada", then we can derive the
            following:

                    "jutado"       = 'pleased', 'delighted', 'thrilled',
                                            'gratified', 'appreciative'
                    "nejutadi"     = 'enjoyment', 'pleasure', 'delight'
                    "nejutasodo"   = 'likable', 'enjoyable', 'pleasing',
                                            'delightful'
                    "nejutasodi"   = 'likableness', 'likability',
                                            'enjoyability'

            Applying the same logic, verb forms will mean 'having the
            quality or ability' and will maintain their original argument
            structure.  Thus, from "konloda" meaning 'to teach', we can derive
            "nekonloda" meaning 'to have the ability to teach' or 'to know
            how to teach'.  In effect, we are divorcing the act from the
            ability.  Thus, the verb "nekonloda" means that someone has the
            ability to teach (but not necessarily that this ability is
            actually put to use).

            It is essential to note that this convention is contrary to our
            usual approach, which would force us to interpret "nekonloda" as
            'to BE the ability to teach'.  However, this is not a useful
            interpretation and can be achieved, if necessary, using the verb
            "zizada".  The interpretation 'to HAVE the ability to teach' is
            much more useful.  In effect, a derivation using "ne-" will be a
            noun with the meaning 'ability to X'.  All non-noun derivations
            will have the sense 'having the ability to X'.  In other words,
            the noun will represent the ability itself, while all other
            parts-of-speech will represent 'having' the ability.

            If we open up the argument structure of a "ne-" derivation, we
            will be able to fill all argument positions, including the
            subject.  In other words, "ne-" does not change the argument
            structure of a verb.  For example, using a right-branching, VSO
            word order, "nekonlovu John students French" means 'John has the
            ability or knows how to teach students French' (where "-vu" =
            A/P/F-d); "people nekonlovudu students French" ("-du" = open
            adjective) means 'people with the ability to teach students
            French"; and "nekonlovudaw John students French" ("-daw" = open
            noun) means 'John's ability to teach students French'.

            The generic AP/F-s action verb "neguka" indicates that the
            subject has the ability to do or perform the deed elaborated by
            the focus.  Thus, "neguka" is equivalent to the English verb
            "can" or "to be able", as in "John can swim" or "She knew how to
            make a lot of money" (but not "She was able to make a lot of
            money" which actually means that she succeeded in making a lot
            of money).  Note though, that this verb is not likely to be used
            very much in the interlingua, since it is much more efficient to
            add "ne-" directly to a verb.  For example, it is more efficient
            to say "John nekonloda" rather than "John neguka to teach", even
            though both mean 'John knows how to teach'.  The adjective form
            "negukado" means 'able/capable/ competent', and the noun form
            "negukadi" means 'ability/ capability/competence (to do
            something)'.  The middle adjective "negukasodo" means 'doable',
            or 'capable of being done', while the noun form "negukasodi"
            means 'do-ability'.

            When used with P/F derivations, "ne-" plus the open noun part-
            of-speech "-daw" will express the relationship between two
            entities (i.e., what they "have" in their relationship with each
            other).  Here are some examples using a pure right-branching
            syntax (i.e. VSO):

                    "necitudaw John Bill"
                    = 'the similarity between John and Bill'

                    "nejutadaw John swimming"
                    = 'the enjoyment that John has for swimming', 'John's
                            enjoyment of swimming'

                    "nekondaw John mathematics"
                    = 'John's knowledge of mathematics'

                    "netudaw lightning thunder"
                    = 'the relationship between lightning and thunder'

            As seen in the last example, when combined with the generic
            state root "tu", "ne-" will indicate a generic relationship.
            Thus, the simple noun "netudi" will mean 'relationship',
            'involvement', or 'association'.  The unfocused P-s [-F]
            "netusoydi" will mean 'state' or 'condition'.

Here are some new suffixes:

<span id="process_event"></span>

        -vay & -kwa Process and event noun suffixes

            A language needs to be able to talk about events as if they were
            objects; i.e., as if they were nouns.  By doing so, the result
            will have the syntax of a noun, including its ability to be
            modified by adjectives.  Here are some English examples:

            a. Rapid measuring will produce bad results.
            b. We have to make two accurate measurements.

            a. She hates bathing in that dirty lake.
            b. She had a long bath before bed.

            a. Forgetting your anniversary can be dangerous.
            b. I had a terrible lapse of memory.

        Note that all of the (a) examples ("measuring", "bathing", and
        "forgetting") refer to the actual process that takes place
        between the endpoints.  In other words, they look at the event
        "from the inside".  All of the (b) examples, however, refer to
        a discrete event.  In effect, we are looking at the events "from
        the outside".

        Note that the process vs. event distinction for verbs is
        essentially equivalent to the mass vs. count distinction for
        nouns.
        
        In the interlingua, we will allocate the suffix "-vay" to create
        process nouns and the suffix "-kwa" to create event nouns.

        English process derivations typically end in "-ing".  Event
            derivations end in "-ing", "-ion", or "-ment", use the verb
            unchanged (eg. "bath"), or have completely idiosyncratic forms
            (eg. "lapse of memory").

            Here are some more examples (results are nouns by default):

                "cituka" = 'to imitate'
            "citukavay" = 'imitating'
                "citukakwa" = 'imitation'

                "guda" = 'to do something to'
            "guvay" = 'affecting', 'doing (something to
                        someone/something)'
                "gukwa" = 'action', 'deed', 'act'

                "guvya" = 'to run/control/operate/manage/use'
                "guvyavay" OR "guvyakwa" = 'running', 'control(ling)',
                        'operating/operation', 'managing/management',
                'use'
            [Note that English does not seem to make a distinction here
            between the process and event senses.]

                "guka" = 'to do/perform'
            "gukavay" = 'doing', 'performing'
                "gukakwa" = 'activity', 'goings-on', 'doings'

                "gukya" = 'to act/behave'
            "gukyavay" = 'acting', 'behaving'
                "gukyakwa" = 'behavior'

            Processes and events maintain their argument structure.  Thus,
            the open noun form (assuming a right-branching word order)
            "citukakwadaw John koncindi" means 'John's imitation of the
            teacher', while the middle version "citukakwaso koncindi"
            means 'imitation of the teacher'.  [Note that we did not use the
            open noun part-of-speech suffix "-daw".  We will adopt the
            convention that when a voice suffix is added to a process or
            event noun, the result will always be an open noun.]

        Finally, since we tend to think of process and event derivations
        as "things" rather than as verbal clauses, we will adopt the
        convention that derivations that use "-vay" or "-kwa" must
        always be nouns (open or closed).  Technically, there is no
        semantic difference between an open process or event verb and an
        open process or event noun.  The only difference would be
        syntactic, since a noun form can be modified by an adjective
        (open or closed) while a verb equivalent would require either an
        adverb, case tag, or previous-word modifier.  By adopting this
        convention, translation software will be simpler since it will
        only have to deal with one form.

        -vi Infinitive/Participle suffix

            The infinitive/participle suffix is used when the verb is part
            of an embedded sentence and when its subject is the same as one
            of the preceding arguments of the outer verb.  The English
            equivalent is the particle "to", as in "John wants to go now" or
            "He tried to open the door" or "I told the children to sit
            down".  It can also sometimes be represented by English gerunds
            ending in "-ing", as in "I know eating fried foods is bad for my
            health" or "He hates getting up early".  Be careful not to
            confuse the infinitive/participle with the purpose case role, as
            in "Bill opened the window (in order) to cool off the room".
            [We'll discuss the derivation of the purpose case tag later.]

            When used as indicated above, infinitives are inherently non-
            finite and should never be marked for tense and aspect.  [We'll
            have more to say about tense and aspect later.]

            Suffix "-vi" should also be used to mark a verb if it has the
            same subject as a preceding verb that it is linked to by means
            of a conjunction or case tag.  Here are two examples in English:

            I broke the window by kicking it.

                Joe opened the window and left the room.

        In the first example, the word "kick" should have the suffix
            "-vi" to indicate that the subject of "kick" is the same as the
            subject of "broke".  In the second example, the word for "left"
            should use "-vi" to indicate that its subject is the same as the
            subject of "opened".  When used in this way, a word marked with
            "-vi" may also be marked for tense and aspect, as in:

                Joe opened the window and will leave the room later.

            However, unless overridden, the tense and aspect that applies to
            the first verb will also apply to the infinitive.

            [Obviously, the tense can be overridden only if the linking word
            is a conjunction.  It would make no sense to do so if the
            linking word is a case tag.]

        -kaw Same arguments as first conjunct suffix

            There are times when we want to have more than one verb use the
            same argument list.  Here are some English examples:

                John opened and closed the window.
                The room was cold and wet.

            In the second example, the words "cold" and "wet" are actually
            P-s verbs in the interlingua.  For example, the adjective
            "cabido" means 'wet' and the P-s verb "cabida" means 'to be
            wet'.

            In the interlingua, syntax follows very strict rules and we
            can't just link verbs together without modifying them in some
            way to ensure that the parser will parse them correctly.  We
            could insist on verbosity, as in "John opened the window and he
            closed it".  However, this will put a significant additional
            burden on the source translator.

            Instead, in the interlingua, we will use the suffix "-kaw" to
            mark the second and subsequent verbs in a chain that have the
            same argument list as the first verb.  Verbs marked with "-kaw"
            cannot take additional core arguments, although they may take
            additional oblique arguments.  If so, the additional oblique
            arguments will apply only to the verb they immediately follow.
            For example (using VSO word order):

                    Canzanvyu John licandi pye canfivyukaw kanxekoy.
                    opened    John window  and closed(kaw) quickly
                    'John opened and quickly closed the window.

            In the above example, "canfivyu" inherits the arguments "John"
            and "licandi" from "canzanvyu".  However, "kanxekoy" applies only
            to "canfivyu".

            Note that it is not possible to apply an argument to the first
            conjunct and not apply it to the second and
            subsequent conjuncts.  For example, it is not possible to say
            "John quickly opened and closed the door", where "quickly"
            modifies only "opened".  Here's the example:

                    Canzanvyu John licandi kanxekoy pye canfivyukaw.
                    opened    John window  quickly  and closed(kaw)
                    'John opened and closed the window quickly.

            In other words, since "quickly" modifies "opened", it also
            automatically modifies "closed".  If we wish to modify only
            "opened", then we must use periphrasis in both English and the
            interlingua, as in "John quickly opened the window and then
            closed it".

        -say Reflexive suffix

            In a reflexive construction, an argument is marked as being
            identical to the subject of the verb.  Most reflexive
            constructions in English use the morpheme "self" to mark this
            function.  In the lexical semantic system we are discussing
            here, this function is often performed by deriving a verb whose
            subject is AP. For example, the verb "to kill" is an A/P-d verb,
            while the AP-d version means 'to kill oneself or commit
            suicide'.  There are situations, however, when we must
            reflexivize a focus, creating subjects that are either PF, APF,
            or AF. There will also be cases where we want to reflexivize an
            action, as in "He kicked himself".  The reflexive suffix "-say"
            will allow us to do this.  Here are some examples:

            A/P/F-s "moyva" = 'to keep (something) away from (somewhere)
            A=F/P-s "moyvasay" = 'to keep (something) away from oneself',
                                            'to keep away/out'

            A/P/F-d "moyvu" = 'to move (something) away from (somewhere)'
            A=F/P-d "moyvusay" = 'to send/move away', 'to dismiss/dispatch/
                                            expel', 'to cause P to become
                                            away from oneself'

            Note the use of "=" in the above notation.  While it could be
            omitted in the above examples without confusion, it can
            not be omitted for action verb derivations such
            as "to kick oneself", because, for actions, AP has a different
            meaning than A=P.

            Here are a few English examples:

                A=F-d [+P]  'self-explanatory'

                P/F-s       'to be with'
                AP/F-s      'to accompany'
                A=F/P-s     'to bring/take along'

                AP=F-s      'self-admirer' and 'self-admiration'
                            'self-contempt'

            Note that, in all cases, X/Y becomes X=Y.

            For state derivations, X/Y/Z becomes X=Z/Y (NOT X=Y/Z!).  There
            is never a need to go from X/Y/Z to X=Y/Z since this capability
            is already available as an AP/F verb derivation.

            For action derivations, X/Y/Z does become
            X=Y/Z.  There is never a need to go from X/Y/Z to X=Z/Y, since
            it would never make sense for the focus of an action to be
            identical to the agent of the action.

            We can use the generic noun "masay" (P-s noun by default) to
            represent English words such as "myself", "themselves", etc
            when we wish to create a stand-alone reflexive. (This is
            actually closer to the Japanese "jibun", since it does not
            indicate person or number.)  Here are a few examples:

                He killed masay = He killed himself.
                I saw masay in the mirror = I saw myself in the mirror.

            The adjective form "masaydo" can represent the English word "own",
            as in the following:

                He killed masaydo mother    = He killed his own mother.
                They brought masaydo chairs = They brought their own chairs.
                I wanted masaydo business   = I wanted my own business.
                                    OR      = I wanted a business of my own.

            Finally, English often uses "self" in ways that are not truly
            reflexive.  For example, words like "self-discovery" and
            "self-satisfaction" are essentially idiomatic, and "-say" does
            not capture these meanings.  Others, such as
            "self-ignition", imply that something happens automatically,
            with no apparent agent.  These can be implemented using
            the basic P-d version of the verb.  Also, expressions such as
            "he himself" are emphatics - and not true
            reflexives.  [We'll discuss how to derive emphatics later.]

        -vaw and -saw Reciprocal suffixes

            In a reciprocal construction, the subject performs the roles of
            both subject and object.  Most reciprocal constructions in
            English use a plural or compound subject and the phrase "each
            other" as the object, as in "They punched each other". Some
            verbs, however, are inherently reciprocal, and we will use the
            reciprocal suffix to create them.  Thus, this suffix will change
            the argument structure of a verb from X/Y-x to X+Y-x or from
            X/Y/Z-x to X+Y/Z-x.  (Note the use of "+" in the notation
            "X+Y-x".  This is necessary since the semantics of reciprocal XY
            is different from the semantics of normal XY.)  Here are some
            examples:

            P/F-s:  "tudu" = 'about', 'for', 'associated with', 'in a
                               relationship with', 'involved with', 'having
                               something to do with'
            P+F-s   "tuvaw" = 'mutual', 'reciprocal', 'having an unspecified
                               association or relationship with each other',                           
                    "tuvawdi" = 'correlative' (i.e., things which have
                                an unspecified relationship or
                                association with each other)

            P/F-s   "citudu" = 'similar to', 'like'
            P+F-s   "cituvaw" = 'alike/similar', 'likesimilar each other'

            Here are a few English examples:

            A/P-d       'to argue/quarrel with'
            A+P-d       'to argue/quarrel'

            A/P/F-d     'to speak to... about...', 'to tell'
            A+P/F-d     'to converse/talk about', 'to discuss', 'to have a
                                conversation about'

            We can use the generic "mavaw" (P-s noun by default) to
            represent the English phrase "each other" or "one another" when
            we need to apply the concept in a non-verbal form.

            Finally, it will also be useful to have a reciprocal suffix that
            equates the patient and the focus of an A/P/F verb; i.e. A/P/F
            -> A/P+F.  For this purpose, we will use the suffix "-saw".  For
            example, the A/P/F-d locative verb "pyovu", meaning 'to move P
            to F', becomes A/P+F-d "pyovusaw", meaning 'to put P and F
            together', 'to bring together', 'to gather', 'to round up', 'to
            muster', 'to assemble', etc (literally: 'to cause object
            components to become "at" each other).

        -ko Apply/Use suffix

            Many languages have ways to derive verbs from nouns with the
            meaning 'to apply noun to patient' or 'to use noun for/on
            patient'.  In the interlingua, the suffix "-ko" is used for this
            purpose, and creates an A/P-d action verb from the noun root.
            Here are some English examples:

            "to brush" from the noun meaning 'brush'
            e.g. "Louise brushed her hair."

            "to hammer" from the noun meaning 'hammer'
            e.g. "I hammered the spike into the crossbeam."

            "to truck" from the noun meaning 'truck'
            e.g. "We trucked the goods into town."

            "to paint" from the noun meaning 'paint'
            e.g. "I need to paint the shed".

            "to radio" from the noun meaning 'radio'
            e.g. "They radioed the soldiers at the river."

        Note that, in each case, we can paraphrase the result as "the
        agent uses the noun for or on the patient, or applies the noun
        to the patient in a way that is inherent to the noun's nature".

        The suffix "-ko" should only be used with noun roots, with one
        exception: when suffixed to the generic action root "gu", the
        result "guko" will be equivalent to English 'to use on/for' or
        'to apply to'.  However, unlike all other "-ko" derivations,
        "guko" will be A/P/F-d.  This is necessary because, when "-ko"
        is added to a noun root, the root itself is the inherent focus.
        However, when used with "gu", the item or substance being used
        must be explicit, allowing it to be expanded via modification.
        For example, we can use "guko" to say something like "I used
        two bars of soap on the dogs", where "two bars of soap" is the
        explicit focus.  [IMPORTANT! Note that the explicit focus
        usually precedes the patient in English.  In the interlingua,
        the patient must precede the focus.]

        Do not confuse "guko" with "guvya".  "Guvya" indicates that
        the agent is simply in control of the patient, while "guko"
        indicates that the focus is being used according to its nature
        to cause the patient to undergo a change-of-state.  If in doubt,
        use "guvya", since it is more general.  This is especially true
        if there is no clear implication that someone or something is
        undergoing a change-of-state as a result of the usage of the
        item.

        It's important to emphasize that when "-ko" is added to a root,
        the result is an action verb, not a state verb, and the result
        emphasizes what the agent is doing rather than what the patient
        is experiencing.  Thus, the final state of the patient may not
        be obvious.  If this very important difference between state and
        action concepts is not clear to you by now, you may want to
        refresh your memory by re-reading the sections on state verbs
        and action verbs.

        Finally, "-ko" should not be used to indicate that the noun is
        added to the patient, as in the English verbs "to salt" or "to
        water".  We'll see how to handle this sense in the next section.

        -vye and -vyo Add and Remove suffixes

            Many languages have ways to derive verbs from nouns with the
            meaning 'to add noun to patient' or 'to remove noun from
            patient'.  In the interlingua, the suffix "-vye" is used for the
            'add' sense and "-vyo" is used for the 'remove' sense.  In
            either case, the result is an A/P-d state verb.  Here are some
            English examples:

            "to water/hydrate" and "to dry/dehydrate" from the noun
                meaning 'water'

            "to plant" and "to remove plants from" from the noun meaning
                'plant'

            "to pressurize" and "to depressurize" from the noun meaning
                'pressure'

            "to salt" and "to de-salt/desalinate" from the noun meaning
                'salt'

        These suffixes should only be used with noun roots, with one
        exception: they may be suffixed to the generic binary state root
        "za".  "Zavye" will be equivalent to English 'add to', while
        "zavyo" will be equivalent to English 'extract or remove from'.
        However, unlike all other "-vye" and "-vyo" derivations, these
        two words will be A/P/F-d.  This is necessary because, when the
        suffix is added to a noun root, the root itself is the inherent
        focus.  When used with "za", however, the item or substance
        being added or removed must be explicit, allowing it to be
        expanded via modification.  For example, we can use "zavye" to
        say something like "I added two teaspoons of salt to the soup",
        where "two teaspoons of salt" is the explicit focus.
        [IMPORTANT! Note that the explicit focus usually precedes the
        patient in English.  In the interlingua, the patient must
        precede the focus.]

        Do not confuse "-vye" with "-ko".  For example, if the
        interlingua word for 'refrigerator' is "bujinbyadi", then
        "bujinbyako" means 'to refrigerate' (literally, 'to use
        refrigerators on the patient in the way they are normally
        used'), while "bujinbyavye" means 'to add refrigerators to', as
        in "We need to add refrigerators to the building".

<span id="S6_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 6.1 The Antonymic Semi-Root "bu-"

A small number of root classifiers have antonymic forms that can be used to create true opposites. We saw an example of this earlier (i.e., "pyo" vs. "moy"). We'll see a few more later. Only classes that have **many** true, semantic opposites will have contrasting pairs of classifiers.

However, it will also be useful to be able to create approximate opposites; i.e., words which are not true antonyms but are highly contrastive. In the interlingua, we will use the modifying semi-root "bu" for this purpose. This semi-root can also be used to create true opposites for roots whose classes do not have contrasting classifiers.

Keep in mind that, since "bu-" is just a modifying semi-root, it is not being used with semantic precision. Instead, as with all modifying semi-roots, it is being used only for its mnemonic value. Here are a few examples:

        cafedi = oasis
        bucafedi = desert

        caxadi = tupelo, sourgum (swamp trees)
        bucaxadi = cactus

        cakundi = monsoon, rainy season
        bucakundi = dry season

        jutada = to like, to enjoy
        bujutada = to dislike

Note that "bu-" changes the meaning of the root, but does **not** change the class or argument structure. For example, we cannot create "bucadi" (meaning 'soil/earth/dirt') from "cadi" (meaning 'water'), because the word meaning 'soil' requires a different classifier.

When used with the generic state root "tu", "bu-" will imply a lack of relationship for "-s" verbs and a breaking-off of a relationship for "-d" verbs. For example, the P/F-s verb "tuda" means 'to have something to do with', 'to be involved with'. Thus, "butuda" means 'to have nothing to do with', 'to be not involved with'. The AP/F-d verb "tuku" means 'to cause oneself to get involved with' in the sense that the subject is entering a new relationship with the focus. Thus, the opposite form "butuku" has the sense 'to break off/away from', 'to leave', 'to give up on', 'to quit', 'to have done with', 'to abandon', and so on, as in "He gave up his membership" or "He left the partnership". Keep in mind that generic verbs do not specify the nature of the relationship. Thus, the unspecified relationship can be **anything**: social, mental, locative, or even temporal.

Finally, do not confuse the [prefix "no-"](#negator) with the antonymic semi-root "bu". The prefix modifies the entire word while the semi-root creates an antonym of the root. For example, "moykudi" means 'departer' while "nopyokudi" means 'non-arriver'. <span id="S7_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 7.0 Simple Generics

The simplest possible generic derivation would consist of just the true generic root "ma" and, if necessary, an appropriate part-of-speech marker. Also, to represent true genericity, the default class of "ma" must be "0" (as also represented by the "0" non-linking suffix "-koy", which we discussed [earlier](#S4_1_1)).

By its very nature, a pure generic like this can encompass any or all possible referents. In other words, they perform the same functions as the impersonal constructions of English and other natural languages.

Since "ma" **can** be a stand-alone word, we will let it be a "0" class adjective by default. Thus, the word "ma" will be equivalent to the word "mado".

Here are the derivations:

        Generic adjective "ma" - 'a/an/some (singular)', some (plural)

                e.g.  We need AN empty box.
                      SOME jerk just blocked my car.
                      SOME people are at the door.

        Generic noun "madi" - 'something/anything'

                e.g.  SOMETHING broke the window.
                      Did you see SOMETHING in the lake?
                      Billy didn't break ANYTHING.

                [Note that "madi" cannot be translated as 'somebody/
                anybody', because these words can only be applied to
                people and are therefore too specific.  To get the sense
                of 'somebody/anybody', we can use the words meaning 'a
                person' or 'some people'.]

        Generic verb "mada" - 'something's going on/happening'

                e.g.  SOMETHING'S GOING ON here.
                      If he persists, SOMETHING's bound TO HAPPEN.

                [Note that since "mada" does not specify an argument
                structure, it cannot have ANY core arguments, and may
                stand alone as a complete sentence.  All arguments, if
                any, must be oblique.]

        Generic adverb "made" - 'you know', '... or something', 'somewhere',
                                'somehow', 'for some reason or other',
                                'among other things', etc.

                ["Made" simply indicates that the verb can take more
                arguments; i.e., that there's more that can be said, but
                that the speaker either can't or won't specify.]

        Generic previous-word modifier "maday" - 'somehow'

                ["Maday" can be used to modify adjectives or adverbs.]

If we apply the antonymic morpheme "bu-", the results are also very useful.

        "bumado" - 'no', 'not'
                e.g.  NO man left these footprints.
                      I saw Bill but NOT John.

            [Note that only "ma" is an adjective by default.  Thus, we
            must use the part-of-speech suffix "-do" with "buma".  The
            reason for this will become clear later when we discuss
            unfocused comparatives.]

        "bumadi" - 'nothing', 'nil', 'naught'

        "bumada" - 'nothing's going on', 'nothing happened'

        "bumade" - 'that's all', 'that's it', 'no more', etc.

                [Like "made", there is no close English equivalent to
                "bumade", which indicates that the verb can take no more
                arguments.]

Note that it would be semantically odd to have additional oblique arguments following "made" or "bumade", even though the syntax allows it. <span id="S7_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 7.1 Omitted Arguments

In the interlingua (as well as in many natural languages), verbs are marked to explicitly show their argument structure. Thus, for instance, a speaker will not normally use a verb that takes a focus unless he plans to provide a focus. If he wishes to omit an argument, he can use an appropriate voice-changing operation. In English, however, many of these voice-changing operations are not available and objects are often omitted, as in the following:

        John is eating    vs.  John is eating a sandwich.
        Bill told a joke  vs.  Bill told the kids a joke.

There will be times, though, when a speaker wishes to emphasize that an argument is being intentionally omitted.

In the interlingua, the basic generics "made", "bumade", "madi", and "bumadi" allow us to do this. The generic "madi/bumadi" fills a **single** empty slot in the argument structure of the verb, while generic "made/bumade" does the same for an oblique argument. However, these should **not** be used when the actual argument or modifier is known from context or is irrelevant. If it **is** known from context or is irrelevant, then an appropriate argument structure suffix or voice operation should be used. For example, in "John is eating", if what John is eating is irrelevant (i.e., the speaker is only interested in saying what John is **doing**), then the AP-s form of the verb should be used. \[Note that this is equivalent to the anti-middle of the AP/F-s word.\] In "Bill told a joke", if the audience is assumed from context, then the anti-middle voice should be used. Otherwise, the anti-passive should be used (which gives the speaker the option of specifying the audience obliquely; e.g. "Bill told a joke TO THE CHILDREN"). <span id="S8_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 8.0 Polarity

Many concepts are inherently scalar in nature; i.e., they can be easily modified to indicate their degree, as in "extremely cold", "very cold", moderately cold", "not so cold", and so on. The degree that applies to a concept is what we will call the *polarity* of the concept.

We've already had some exposure to the concept of polarity when we used the antonymic semi-root "bu-". As we've seen, this morpheme can also be used to create true opposites for state concepts that can have only an "either/or" interpretation. I will refer to these as *binary* states. Here are some English examples:

        open            ->      close = become 'not open'
        attach          ->      detach = become 'not attached'
        recall          ->      forget = become 'not in-memory'
        enter           ->      exit = become 'not inside'
        zip             ->      unzip = become 'not zipped'
        same            ->      different = be 'not the same'

In other words, for binary states, anything that is 'not X' is by definition 'the opposite of X'.

When used with concepts that do not have true opposites, "bu-" can be used only for its mnemonic value. For example, as we saw earlier, "cafedi" = 'oasis' vs. "bucafedi" = 'desert'.

Another type of opposite is called an *antonym*. Antonyms are fully scalar concepts that are in opposition to **each other**. These are true opposites (as opposed to binary opposites). Examples of these are 'hot/cold', 'heavy/light', 'happy/sad', 'love/hate', and so on. In the interlingua, we will also use "bu-" to create these antonyms, unless an antonymic classifier exists. Note that these are **not** binary opposites! For example, something that is not hot is not necessarily cold - it can also be neither hot nor cold.

A good test is to ask yourself if "slightly X" means the same as "mostly Y", where X and Y are the opposites. If they mean the same, then they are binary opposites. Otherwise, they are scalar opposites. For example, "slightly drunk" has essentially the same meaning as "mostly sober", and vice versa. Thus, "drunk/sober" are binary opposites. However, "slightly hot" does **not** mean "mostly cold", since it's possible to be neither hot nor cold. Thus, "hot/cold" are scalar opposites.

In addition to the above oppositions, there are concepts that can cover a range of oppositions, such as 'torrid/hot/warm/lukewarm/cool/chilly/cold/frigid'. These concepts are *scalar* and can take on more than two values. However, natural languages almost never make minor distinctions such as between "cold" and "cool" or between "warm" and "hot" with completely different words. Instead, modifiers are normally used, as in "heavy" vs. "very heavy" vs. "not too heavy", etc. Also, when a language does make such a distinction using unique words, it is rare to find other languages that make the same distinction. For example, the Arabic word "baarid" can mean either 'cool', 'chilly', *or* 'cold'. Expressions meaning 'very', 'not too' and so on are used to provide greater detail when needed.

So, summarizing the above, there are basically four types of opposites:

        1. Binary opposites:
           real vs. imaginary
           open vs. closed

        2. Mnemonic opposites:
           oasis vs. desert
           monsoon (rainy season) vs. dry season
           tupelo/sourgum (swamp trees) vs. cactus

        3. True antonyms:
           fast vs. slow
           heavy vs. light
           high vs. low

        4. Scalar opposites:
           hot vs. warm vs. cool vs. cold
           gigantic vs. large vs. small vs. tiny
           bright vs. light vs. dim vs. dark vs. pitch black

There will be some cases in which the distinction between binary and scalar opposition is not clear. This generally occurs when a concept can be binary in one context and scalar in another. For example, the concepts 'wet' and 'dry' are in binary opposition in an example such as "The table is wet/dry", since, if the table is not wet, then it **must** be dry - there is no middle ground. However, in a case like "The climate here is wet/dry", the opposition is scalar, since 'not wet' does not necessarily imply 'dry', and vice versa. It's also possible for a climate to be 'average' or 'normal'; i.e., neither wet nor dry.

In situations like this, we will always implement the words using a scalar classifier, since it is less limiting. For example, the word "cabido" will mean 'wet' and "cazudo" will mean 'dry', where "-bi" is the classifier for vague, scalar non-relational states and "-zu" is its antonym. <span id="S8_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 8.1 Implementing Polarity

As we've already seen, binary, mnemonic, and true opposites can be created using "bu-", but how do we deal with scalar opposites? In other words, how do we indicate the degree of a concept?

In the interlingua, we will start by creating five new semi-roots that can provide the necessary additional detail. These will hardly ever be needed with true scalar concepts to represent unique words from natural languages, since most people will prefer to use external modifiers such as "very", "not too", "hardly", etc. But there will be times when these concepts will be needed in word derivations.

Here are the morphemes that we will use in the interlingua:

        bi-     'maximally', 'extremely', 'utmost'

        xe-     'very', 'highly'

        la-     'average', 'typical', 'midway'

        fo-     'not too', 'not very'

        zu-     'minimally', 'barely', 'hardly'

We will refer to all of the above morphemes as *polarity semi-roots*.

It's important to emphasize that these semi-roots can **not** be used for the creation of one-time, one-shot, or off-the-cuff words (i.e. what linguists refer to as "nonce" words), unless the root being modified is a scalar non-relational state (or one of the few other inherently scalar roots that we will discuss later). For all other roots, these semi-roots are non-productive and thus **must** have valid dictionary entries in all target languages. For scalar non-relational states, the dictionary will contain a polarity derivation only if the target language has a unique word for it. For example, the word meaning "cool" will have an entry in the English dictionary but not in the Arabic dictionary.

When a polarity semi-root is **not** used, the default interpretation for scalar non-relational states will be a normal distribution whose center is "la-". This interpretation appears to be universal among natural languages.

In addition, we will assume that the semantic space of "bi-" is a subset of the semantic space of "xe-", and that the semantic space of "zu-" is a subset of the semantic space of "fo-". We'll see examples of this below.

Using the above, we can start with the word "jinxedo" meaning 'hot'. Note that "xe" in "jinxe" is a **classifier** - **not** a semi-root! Thus, it is not being used here for its polarity value - it is being used for its class. And in the word "xejinxedo" (meaning 'very hot'), "xe" is being used both as a polarity modifier and a classifier. If you don't understand this distinction, then you should re-read the beginning of [section 3.2](#S3_2).

Now, from the root "jinxe", we can also create words such as "bijinxedo" = 'torrid/scorching', "fojinxedo" = 'warm', "zujinxedo" = 'lukewarm/tepid', and so on.

However, as I stated above, natural languages hardly ever create distinct words to represent such concepts, depending instead on external modification. To make matters worse, the derivations may only be approximate. For example, we could also gloss "vijinxedo" as either 'blistering' or 'scalding', but these all have implications beyond basic 'hotness', since they imply manner as well as degree of heat. Actually, the gloss 'torrid' is also somewhat inappropriate, since it has connotations of both 'dryness' and 'climate'.

Keep in mind, though, that this lack of precise English counterparts is not a problem at all. As long as the semantics of the derivations are precise, there will never be any doubt about their meaning, even though a particular derivation may not have an exact counterpart in a particular natural language. As I mentioned earlier, it is almost always impossible to find exact matches for a word in different languages. Also, the above derivations are actually more useful than the English counterparts, since they are slightly more general and can be used in more contexts. Specific implications such as 'climate' or 'dryness' are either obvious from context, or can be made obvious, if necessary, by further elaboration.

Here are some examples using relational verbs:

        P/F-s   "citudu"    = 'like', 'similar to', 'analogous to'
                "bicitudo"  = 'identical'
                "bucitudo"  = 'dissimilar/different'

\[The above English words are sometimes used with a reciprocal sense. For example, in "This is a similar problem", we would use the word "citudo" for the adjective "similar". However, for "We had two similar problems", we really should use "cituvaw" (where "-vaw" is the reciprocal suffix) if the two problems were similar to each other. However, "citudo" is more general since it is less specific and, thus, includes both senses.\]

Compare the above derivations with derivations using "zizada":

        P/F-s:  "zizada"   = copula 'to be'
                "zizado"   = 'same', 'equal'
                "buzizado" = 'not the same', 'unequal', 'different',
                                      'other'

For a binary state, the positive pole is often scalable, even though the negative pole is not. For example, there are several degrees of 'pregnancy', 'openness', 'fullness', and 'inebriation', but the same does not apply to their opposites 'non-pregnant', 'closed', 'empty', and 'sober'.

Here are some useful examples derived from the binary P-s adjective root "benxo", meaning 'intelligent:

        benxodo   = intelligent, having intelligence
        bibenxodo = brilliant, genius, exceptionally intelligent
        xebenxodo = smart, bright, sharp, very intelligent
        labenxodo = of average/medium intelligence
        fobenxodo = stupid, dumb, obtuse, doltish
        fobenxodi = ignoramus, dolt, dunce, dope, dumbbell
        zubenxodo = moronic, retarded, idiotic, dim-witted,
                       feebleminded, simpleminded
        zubenxodi = idiot, simpleton, dullard, dimwit, nitwit,
                       moron, imbecile, half-wit
        benzando  = non-intelligent, lacking intelligence,
                       unintelligent, mindless

Note that someone who is 'genius' is also 'bright', but someone who is 'bright' is not necessarily 'genius'. Thus, "bi-" derivations are a subset of "xe-" derivations. For the same reasons, "zu-" derivations are a subset of "fo-" derivations, and "la-" derivations are a subset of the unmarked case. In fact, all derivations **except** those using "bu-" or an antonymic classifier are subsets of the unmarked case, because "very intelligent" people, "barely intelligent" people, and so on are still "intelligent".

Finally, a completely different kind of opposite can be derived by means of the inverse grammatical voice change (suffix "-kwe"). These words will all be derived from P/F-s state verbs, since they indicate a relationship between two entities. Here are some examples:

           Active            Inverse
        ------------      --------------
        to own            to belong to
        to enclose        to be inside of
        to be above       to be under/beneath/below

Opposites of this type are normally referred to as *converses*. <span id="S9_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 9.0 Counts and Measures

Counts (also called *quantifiers*) and measures are inherently stative because they provide more information about the state of an entity. Consider the following:

        He saw students.
        He saw tall students.
        He saw three tall students.
        He saw three 6-foot tall students.

Each use of a count or measure reduces the number of possible referents, just as if they were adjectives. Thus, counts and measures are inherently stative - they just happen to be quantitative rather than qualitative. <span id="S9_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 9.1 Implementing Count Words

In the interlingua, a numeric quantity, regardless of magnitude or complexity, will be implemented as a single root whose syllables are compositional, and whose classifier is "-mu". Each stand-alone numeric word will have the following format:

        xay-    minus sign (default = positive)

        --  cardinal (This is the default.)
        -ta ordinal
        -faw    N-ary, Nth in importance, rank, or value
        -ji N-tuple, N of a kind, N in one

        Numeric components:

        bu- zero
        ca- one
        fe- two
        gi- three
        jo- four
        lu- five
        ba- six
        ze- seven
        ti- eight
        xo- nine

        Numeric linkers:

        -loy-   decimal point
        -tu-    exponent
        -co-    negative exponent
        -zoy-   real/imaginary separator
        -go-    fraction, X/Y

By default, all numeric words formed with classifier "-mu" will be P-s adjectives.

Here are some examples:

        bumu = 0, no
        camu = 1
        catamu = 1st
        cafawmu = primary, main, chief
        cajimu = single
        gimu = 3
        gitamu = 3rd
        gifawmu = tertiary
        gijimu = triple
        fexomu = 29
        fexotamu = 29th
        febubumu = 200
        febufemu = 202
        feloylumu = 2.5
        xayfeloylumu = -2.5
        fegogimu = two-thirds
        lugocafemu = five-twelfths

        feloylubuxotuxomu = 2.509 x 10**9
        gizoyfemu = 3 + i2
        fezoyxayjomu = 2 - i4
        feloyfezoygiloyjomu = 2.2 + i3.4

        mu = any, some, a number/quantity/amount of, greater than zero

If a linker does not have a number to its left, then the default is assumed to be "bu" = 'zero' for decimal point and real/imaginary separator, and "ca" = 'one' for all the other linkers. For example:

        loyluzemu = 0.57
        gogimu = one-third
        tutimu = 1 x 10**8
        cotimu = 1 x 10**-8
        zoyxayfeloyjomu = 0 - i2.4

Now, we also need a way to represent non-specific numeric quantities, such as 'many', 'few', 'all', and so on. Since these are inherently scalar, the ideal approach is to use the scalar polarity semi-roots. Here are the results:

        bimu    all, every, the whole amount of, the maximum amount
                        possible of
        xemu    many, much, lots of, a lot of, a large amount of,
                        numerous, plenty of
        lamu    several, some, a moderate/average/typical amount of
        fomu    a few, a little, a small amount of, not too many, not
                        too much 
        zumu    very few, very little, a tiny/minimal amount of, hardly
                        any, almost no

Here are some examples:

        I saw xemu cabodi
        = I saw many ducks.

        I'd like fomu cadi, please.
        = I'd like a little water, please.

        There's zumu soup in the pot.
        = There's almost no soup in the pot.

Note how, in the last two examples, less specific numerics can also be used to modify mass nouns. In fact, we will adopt the convention that the less specific numerics will have a mass interpretation when modifying mass nouns and a count interpretation when modifying count nouns. For example, "fomu" will mean 'a few' when applied to count nouns and 'a little' when applied to mass nouns. Thus, "fomu cabodi" means 'a few ducks' while "fomu cadi" means ' a little water'.

Specific numerics (including the stand-alone word "mu"), however, must always have a count interpretation, since a mass interpretation would not make sense. For example, "gimu soup" means 'three units/portions/servings of soup' or simply 'three soups', where the unit/portion/serving size is known from context. In effect, the specific numeric forces a count interpretation. Similarly, "mu soup" means 'any/some soups'. If we need the concept of 'any/some soup', we can use the indefinite article "ma".

If the fraction linker "-go-" does not have a string to its right, it will be assumed to be 'all'. When this occurs, only polarity semi-roots may precede "-go-". Here are some examples:

        xegomu  = most, a large fraction of
        lagomu  = about half
        fogomu  = a small fraction of
        zugomu  = almost none of, a tiny fraction of

There will also be times when we will need to treat a count noun as if it were a mass noun and vice versa. Here are some examples:

        Count-to-mass:
            He ate a lot of duck (i.e., a large quantity of duck meat).
        Mass-to-count:
            He owns a lot of rubies.  ('Ruby' is a natural substance and is
                                   a mass noun by default.)

In the interlingua, we will allocate two suffixes to change the default count/mass interpretation of a noun root (result = noun):

        -vay   change to mass noun
        -kwa   change to count noun

Note that these are the same suffixes that we discussed earlier to create [process and event nouns](#process_event). In other words, the suffix "-vay" converts a verbal concept to a process noun and a noun concept to a mass noun. Similarly, the suffix "-kwa" converts a verbal concept to an event noun and a noun concept to a count noun. <span id="plural"></span>

We will also need a non-specific numeric to indicate plurality:

        ni-     plural, more than one

In the interlingua, count and group nouns will always be assumed to be singular unless "ni-" is used:

        cabodi   = the duck
        nicabodi = the ducks

Note that "ni-" can also be prefixed directly to the numeric classifier "-mu" to create the separate word "nimu" meaning 'multiple'.

Now, there will be times when the number of a noun phrase is not known. This will not happen when a person is speaking the language, but **may** happen when a computer is translating from a natural language to the interlingua. (Please keep in mind that this monograph is actually the reference document for an interlingua intended primarily for use as an interlingua in machine translation.) When a machine translation program cannot determine the number of a noun phrase in the source language, it should modify the noun with the special particle "zimwa". This word will behave syntactically as an adjective.

\[Note that "-mwa" is a the classifier reserved for words called "particles". Particles have special syntactic and/or semantic properties that place them outside the general classificational system. Because of this, they rarely undergo further derivation. We'll see more examples of this classifier later.\]

The noun forms of ordinals can be used to represent the specific members of a sequence, as in:

        I need number seven and number thirteen.

where "number seven" is "zetamudi" and "number thirteen" is "cagitamudi". Note that the above can also be paraphrased as "I need the seventh one and the thirteenth one".

The scalar polarity prefixes can also be used with the ordinal semi-root "-ta" to express a non-specific range within the range of possibilities, as follows:

        bitamu      'last', 'final', 'highest in sequence', 'at the
                            very end of a sequence'
        xetamu      'later', 'high in a sequence', 'near the end'
        latamu      'intermediate', 'middle', 'midway', 'midmost',
                            'halfway', 'midway in a sequence'
        fotamu      'early', 'early in a sequence', 'near the
                            beginning'
        zutamu      'first', 'initial', 'lowest in sequence', 'at
                            the very beginning of a sequence'
        tamu        'sequential', 'ranked', 'graded'

When dealing with sequences, it's often very useful to be able to specify next or previous element in the sequence. We will accomplish this by allocating two new semi-roots:

        pan-   previous, minus one-th ordinal
        pun-   next, plus one-th ordinal

Note that the ordinal marker "ta" is not needed with these, since they are inherently ordinal. Here are some examples:

        panmu        'previous/last' (current minus one in sequence)
        punmu        'next' (current plus one in sequence)
        fepanmu      'previous two', 'last two'
        cagipunmu    'next thirteen'

Note that 'one' is the default when the actual number is not specified.

If an ordinal is focused, the focus will indicate the sequence of which P is a part, as in the following example:

        P-s     gitamu      third
        P-s     gitamuda    to be third
        P/F-s   gitamusa    to be third in F, to be in the third
                                 position of sequence F

The last example could be used in a sentence such as "John gitamusa the line", meaning 'John is third in the line.'

We can do similar things with cardinal numbers:

        P-s:    femu            'two'
                femuda          'to be two in number'
                gimuda          'to be three in number'
                feloygimuda     'to be 2.3 in quantity'

        P-d:    femusyu         'to become two in number'

As nouns, cardinal numbers represent the concept "N entities" or "an N-some":

        I have xomu copies left = I have nine copies left.
        Please give me bamudi = Please give me six.

        I met the gimudi yesterday = I met the threesome/trio
                                        yesterday.

<span id="S9_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 9.2 Implementing Measure Words

Earlier, we discussed how the focus of basic scalar state verbs could elaborate the state, as in the following examples:

        Saudi Arabia is rich  vs.  Saudi Arabia is rich in oil.

It's also possible to be even more precise, as in:

        John is rich  vs.  John is rich to the tune of 3 million
                                dollars.

Here, the argument "3 million dollars" is simply the focus of the P/F-s verb meaning 'to be rich'.

In other words, any scalar state that can have different degrees of measurable intensity can be the root of a P/F-s verb that measures the degree of the state. Here are some more English examples:

        P-s: John is tall.
        P/F-s: John is tall 6 feet = John is 6 feet tall.

        P-s: The book is heavy.
        P/F-s: The book is heavy 4 kilograms = The book weighs 4 kilograms.

        P-s: The opera is long (temporal).
        P/F-s: The opera is long 3 hours = The opera lasts 3 hours.

        P-s: The town is far.
        P/F-s: The town is far 20 miles = The town is 20 miles away.

Thus, there is no need to create special roots meaning 'to last', 'to weigh', 'to have a volume of' and so on. We simply need to focus the appropriate P-s state verbs and provide a specific measurement as the focus argument.

Note that English has only a few verbs such as "to weigh" or "to last". It does not have similar equivalents for most of its measure words. For example, we say "He is very tall" - **not** "\*He heights very much", or "The rope is too long" - **not** "\*The rope lengths too much". The system presented here allows you to derive verbs for any kind of measurement. <span id="measure_verbs"></span>

So, let's define a few roots and derive the corresponding measure verbs:

        kunxedo    ->   P-s adjective, scalar state 'long (temporal)'
        kunxesa    ->   P/F-s verb 'to last F'

        bonxedo    ->   P-s adjective, scalar state 'heavy'
        bonxesa    ->   P/F-s verb 'to weigh F'

        layxedo    ->   P-s adjective, scalar state 'long (spatial)'
        layxesa    ->   P/F-s verb 'to be F in length'

Measurement nouns such as "weight", "age", "length", and so on can be obtained via middle voice derivations of the corresponding verbs. For example, the English noun "weight/heft" is the inverse F/P-s noun derivation of the verb "to weigh"; i.e. "bonxesakwedi". We can also use the quality prefix "ne-" for the more general sense of "having weight"; i.e. "nebonxesadi". Note that the inverse derivation indicates an actual value (e.g. "At that weight, he can expect to have serious health problems"), while the quality derivation indicates the quality possessed by the patient, and is probably not that useful. The unfocused "nebonxedi", meaning 'heaviness', is probably more useful.

The case tag "kunxesade" is also useful. It means 'lasting' or 'for' as in "John was sick FOR three days".

Units of measure use the classifier "-zi". Here are a few examples:

        xezidi   ->    'day'
        layzidi  ->    'meter'
        ponzidi  ->    'pound' (English weight measure)

\[Note that, since these are basic nouns, the semi-root is used for its mnemonic value, which means it can be used for its sound value.\]

We will use numeric morphemes to represent Latin and Greek prefixes for multiples of ten:

        -tu-      positive exponent
        -co-      negative exponent
        fe-       two
        gi-       three
        ba-       six

        tugi-     kilo-
        cofe-     centi-
        cogi-     milli-
        coba-     micro-

        tugilayzidi    kilometer
        cofelayzidi    centimeter
        cogilayzidi    millimeter
        cobalayzidi    micrometer

And so on. <span id="numeric_adverb"></span>

When a verb is modified by a number, it has the meaning "N-times" rather than "N-entities". Here is an example:

        canzanvyu = 'to open'
        John canzanvyu the door gimukoy
        = John opened the door three times.

It is important to note that we can **not** use the P-s adverb form - we **must** use the "0" form (suffix "-koy"). The reason is that the P-s form will imply a link to an argument of the verb, thus indicating the quantity of "Johns", which is meaningless, or the quantity of "doors", which can more easily and unambiguously be implemented using the adjective "nimu". The "0" adverb form, however, always modifies the verb. Thus, we are, in effect, indicating the 'quantity' of the verb; i.e. the frequency of the event. \[This is an important distinction that will come in handy again later, when we discuss *comparatives*.\] <span id="always"></span>

Adverbial "0" forms of the [non-specific numerics](#nonspecific_numerics) are also very useful. Here are some examples:

        bimukoy   = 'always', 'all the time', 'at every opportunity'
        xemukoy   = 'often', 'frequently', 'a lot', 'many times'
        lamukoy   = 'sometimes', 'at times', 'now and then'
        fomukoy   = 'occasionally', 'not too often', 'on occasion',
                          'a few times', 'from time to time', 'once in a while'
        zumukoy   = 'rarely', 'seldom', 'hardly ever', 'almost never',
                          'infrequently'

Also, from the specific numerics, we get:

        mukoy     = 'sometimes', 'at times', 'ever (in questions)'
        bumukoy   = 'never', 'zero times', 'not ever', 'not ... at all',
                       'on no occasion'
        camukoy   = 'once', 'one time', 'on one occasion'
        femukoy   = 'twice', 'two times'
        gimukoy   = 'thrice', 'three times'
        fecamukoy = 'twenty-one times'

The ordinal derivations are also useful:

        catamukoy   = '(for) the first time'
        fetamukoy   = '(for) the second time'
        fecatamukoy = '(for) the twenty-first time'

        e.g. "Yesterday, he went to Boston gitamukoy."
            = 'Yesterday, he went to Boston for the third time.'

        panmukoy     = the last/previous time
        punmukoy     = the next time
        gipanmukoy   = the last three times
        lupunmukoy   = the next five times

        e.g. "I'll see you when I'm in Boston punmukoy."
            = 'I'll see you the next time I'm in Boston.'

We can also handle noun phrases that contain both counts and measures:

        Using the open adjective "posadu", meaning 'having/with/of':

            I bought gimu ponzidi mesadu rice.
                    or
            I bought rice mesadu gimu ponzidi.
            = I bought three pounds of rice.

        A relative clause:

            I bought rice that bonxesa gimu ponzidi.
            = I bought rice that weighs three pounds.

        An open adjective version of the P/F-s measure verb:

            I bought rice bonxesadu gimu ponzidi.
            = I bought rice weighing three pounds.

Other derivations of the measure verbs are also useful. Here are some examples:

        P/F-s:          The pig bonxesa 25 pounds.
                        = The pig weighs 25 pounds.

        P/F-d:          The pig bonxesu 25 pounds.
                        = The pig came to weigh 25 pounds.

        A/P/F-s:        He bonxeva the pig 25 pounds.
                        = He maintains the pig at a weight of 25 pounds.

        A/P/F-d:        He bonxevu the pig 25 pounds.
                        = He changed the pig's weight to 25 pounds.
                        [Literally: He caused the pig's weight to become
                        25 pounds.]

        AP/F-s:         The pig bonxeka 25 pounds.
                        = The pig keeps itself at 25 pounds weight.

        AP/F-d:         The pig bonxeku 25 pounds.
                        = The pig changed its weight to 25 pounds.

If we want to create versions of the English verbs that actually measure a state, such as "to time" as in "He timed the performance" or "to weigh" as in "He weighed the rice", then we need to augment the basic state. In the interlingua, we will accomplish this with the special suffix "-swi". When added to a root, it will convert the word to one with the meaning 'to determine or measure the root state'. The result will be an AP/F-d verb. Here are some examples:

        kunxeswi = 'to time', 'to measure/determine the duration of'
        bonxeswi = 'to weigh', 'to measure/determine the weight of'
        layxeswi = 'to measure/determine the (spatial) length of'

We can also create the general derivation "maswi", meaning 'to measure'. Thus, for example, the word "kunxeswi" is equivalent to "maswi bonxesakwedi", meaning 'to measure the duration'.

Distance and time measures often specify a relative position or direction, as in the sentence "The chair is two meters from the window". To handle this in the interlingua, we simply use previous-word modifier forms of the distance or time measure to modify the main locative or temporal relation. Here are some examples (where "layzidi" means 'meter', and "femu" means 'two'):

        John was sitting moy the door.
        = John was sitting away from the door.
        John was sitting moy-layziday-femuday the door.
        = John was sitting two meters from the door.

        The chair moyda the window.
        = The chair is away from the window.
        The chair moyda-layziday-femuday the window.
        = The chair is two meters from the window.

Note that this is exactly what we did with the temporal deictics that we discussed [earlier](#ago_from_now).

Other words with meanings such as "to be to the left of", "to be beneath", "to be after", and so on can also be used in place of "moy" or "moyda". This method can also be used for temporal expressions, as in "I left two hours before the meeting ended".

Finally, do not confuse measure words with specific entities that have precise measures, such as the named time periods "September", "Tuesday", and "1994". These are proper nouns and we'll discuss how to deal with them later. <span id="S9_3"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 9.3 Other Numeric Derivations

It would also be useful to have a separate numeric morpheme to indicate the concept 'N at a time' or 'N per group':

        -be         N at a time, N per group, in groups of N

        cabemu      = each, every, a group of one
        febemu      = both, a group of two ...
        calubemu    = a group of fifteen ...

        cabemukoy   = one at a time, one by one
        febemukoy   = two at a time, two by two, in groups of two
        bibemukoy   = all at once, all at the same time, all together

When we modify the verb with an adverb formed with the "0" suffix "-koy", we are indicating that the event itself is being performed N times simultaneously; i.e., that the event itself is a group of sub-events. Thus, we get the sense of 'N at a time'. In other words, we are linking to the verb itself - **not** to an argument of the verb.

Note that we also used ["be"](#group_sr) earlier when we discussed [group nouns](#S3_6). We are simply extending its meaning for use with numbers.

Now, in the interlingua, we will use the classifier "-bun" to designate arithmetic functions. These words will be P/F-s verbs by default, where P will represent the result of the function and F will represent the argument. If an argument has more than one component, then they will be linked by the conjunction meaning 'and'. Here are some examples:

        xebunda = addition
        cosinbunda = cosine

        Lumudi xebunda gimudi and femudi =
        The sum of three and two is five.
        (Literally, "five is the sum of three and two".)

        Xaycamudi cosinbunda "pi" =
        The cosine of pi is minus one.
        (Literally, "minus one is the cosine of pi".)

Other parts of speech can be derived in the usual way. For example, the open noun phrase "cosinbundaw loylumunti" means 'the cosine of zero point five'. <span id="S9_4"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 9.4 More on the Semantics of Numbers

For scalar states, the focus positions the state within a range of possibilities. For example:

        The man is old   vs.  The man is old (focus =) 90 years.
        The man is tall  vs.  The man is tall (focus =) 2 meters.
        The man is rich  vs.  The man is rich (focus =) $10,000,000.

For numeric states, the number itself is the position within a range of possibilities. In other words, the state is simply 'having quantity' while the numeric value indicates the precise quantity or "position" within the numeric state. In effect, **the specific numeric value is the focus of a generic numeric state** which has been incorporated into the root to make it more precise. Thus, it makes no sense to use polarity prefixes with specific numbers because numbers are polarity markers themselves, only more precise. However, it **does** make sense to use the polarity prefixes with the bare numeric root "-mu", as we did [earlier](#nonspecific_numerics) (e.g. "bimu" = 'all/every', "xemu" = 'many/much', etc).

Also, since numbers are, in effect, the focus of a generic numeric state, an explicit focus would make sense only if it provided more detail about the number, which is either semantically impossible or completely useless, depending on how you look at it. In other words, once a specific value is used with "-mu", the result is inherently unfocusable because the numeric value itself is the effective focus.

However, numbers are often used to indicate a quantity that is part of a larger group, as in "I need two of those oranges". In a situation like this, we cannot use "po" because it implies a genitive relationship; i.e. "two me the oranges" would mean something like 'the oranges' two', which is not the meaning we are interested in here.

Because of this, we **will** allow numbers to be focused to indicate a partitive relationship. Here are some examples:

      Here are femusadaw the oranges = Here are two of the oranges.
      I camuvu the wood the coaches = I made the wood into one of the
                                          coaches.
      I need camusado tool = I need a specific tool.

Note that, since "camusado" is focused, it literally means 'one from an unspecified group', which is equivalent to English words such as "particular", "individual", "select", and "specific". We can also apply other numbers directly, as in "femusado" = 'two specific', and so on.

While the above may not be semantically correct (and I'm not sure myself), we have implemented a very useful form that would otherwise go unused. \[Later, we'll discuss the semantics of a more generally applicable partitive relationship.\] <span id="S10_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 10.0 Deixis

A *deictic* word is one whose referent is determined by the speech context. For example, in the sentence "I ate here yesterday", there are three deictic words:

        1. "I"          - The actual referent depends on WHO uttered the
                          sentence.
        2. "here"       - The actual location depends on WHERE the
                          sentence was uttered.
        3. "yesterday"  - The actual time depends on WHEN the sentence
                          was uttered.

Deictics are inherently unfocusable - **not** because there is no referent - but because the referent can never be stated explicitly. It is always determined by the speech environment.

What's especially fascinating about deictics is the strong relationship between their forms and their meanings in many natural languages, as well as the strong relationship between the meanings of deictics that, on the surface, appear to be completely unrelated. For example, most natural languages have a three-way distinction between personal pronouns, deictic locatives, and demonstratives:

        1st person:     I/we            here            this/these
        2nd person:     you             there           that/those
        3rd person:     he/she/it/they  yonder          yon

Standard English rarely uses "yon" and "yonder" anymore, but it used to be used quite often. Also, languages that make the three-way distinctions for locatives and demonstratives generally do it in the following way:

        this or here     ->     at or near the speaker
        that or there    ->     at or near the addressee
        yon or yonder    ->     away from both speaker and addressee

Note that 1st person is the speaker, 2nd person is the addressee, and 3rd person is neither the speaker nor the addressee. For example, Japanese is fairly typical of how many languages use the same forms for both demonstratives and locatives:

             near speaker   near addressee   far from both
             ------------   --------------   -------------
      adjective  this - "kono"  that  - "sono"   yon       - "ano"
      pronoun    this - "kore"  that  - "sore"   yon thing - "are"
      locative   here - "koko"  there - "soko"   yonder    - "asoko"

While not perfectly regular in the modern language, they all evolved from the same roots. English also has a historical link between "this/here", "that/there", and "yon/yonder", although it is less regular. An even better example, though, is Cambodian where the word "nih" means either 'this' or 'here', and the word "nuh" means either 'that' or 'there'. And in Turkish, the same root is used to derive the third person pronouns meaning 'he/she/it/they', the demonstrative meaning 'that', **and** the locative meaning 'there'.

As it turns out, this correlation between form and meaning, and the obvious link to 1st, 2nd, and 3rd person referents is quite common among the world's languages.

Another major difference between deictics and other words is that deictics do not indicate, in any way at all, the nature of their referents. For example, on hearing the noun "duck", we immediately know a lot about the referent. However, the pronouns "you" or "that" or the adjectives "my" or "this" or the locatives "here" or "yonder" tell us nothing about their referents. Instead, they simply 'point to' the actual referent.

Deictics are also different from open class words such as nouns and verbs because there are very few of them, and because new ones rarely enter a language. For example, new nouns are adopted by a language quite often, while deictics are the result of slow and gradual language evolution that can take centuries.

Incidentally, since the referents of deictic expressions are effectively 'indexed' by the location of the speaker and the addressee, deictics are also sometimes called *indexicals*, and deixis (i.e. the phenomenon itself) is sometimes referred to as *indexicality*. Also, words that are members of small, closed groups, such as pronouns, demonstratives, tense-aspect words, and articles are called *closed class* words, while words that are members of large, open groups, such as nouns and verbs, are called *open class* words. It's rare when a closed class word enters or leaves a language, whereas open class words change frequently.

In the next few sections, I will describe a highly regular system that can be used to implement personal pronouns, possessive adjectives, possessive pronouns, demonstratives, and deictic locative and temporal words. <span id="S10_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 10.1 Personal Pronouns, Possessive Adjectives, and Possessive Pronouns

In the interlingua, I will implement deictics by allocating a set of root morphemes that are **mnemonically** compositional. In other words, deictics will be formed from true, unique root morphemes, but we will design them in a way that will display their inherent compositionality.

For personal pronouns and possessives, the basic components will be as follows:

        1:      --
        2:      fe-
        3:      gi-     Pronoun:  -mi     P-s noun by default
        1+2:    jo-
        1+3:    lu-     Genitive: -poy    P-s adjective by default
        2+3:    ba-
        1+2+3:  ze-

Note that "-mi" and "-poy" are root-terminators. Thus, a part-of-speech suffix is not needed if the default applies.

The first three are inherently singular, and the remaining four are inherently plural.

Here are the derivations that correspond to the English personal pronouns and possessive adjectives:

        1:  I = mi, my = poy, mine = poydi
        2:  you = femi, your = fepoy, yours = fepoydi
        3:  he, she, it = gimi
            his, her, its = gipoy
            his, hers, its = gipoydi
    1+2+3:  we = zemi, our = zepoy, ours = zepoydi

The 3rd person forms will not be used very much, since it will almost always be more appropriate to use anaphora. I'll have more to say about this later in the chapter on [Anaphora](#S17_0).

Note that the 1+2+3 form "zemi" is being used for English "we". This is because English "we" includes the speaker and any others whether they are present or not.

The second and third person forms can be made plural by using the plural prefix ["ni-"](#plural), which we introduced earlier:

        nifemi = you (plural), you all
        nigimi = they/them

\[Some languages use the 2nd person plural form with singular referents to indicate politeness. We'll discuss how to do this later.\]

If gender must be specified, we will use the following prefixes:

        male:           naw-
        female:         noy-

We have also given a special interpretation to the 1+2+3 form. It will be interpreted as **either** 1+2, 1+3, *or* 1+2+3. This will make it conform to natural language universals, since a true 1+2+3 form does not seem to exist in any natural language, whereas forms *do* exist in many languages for the interpretation we are using here (such as English "we").

Quite a large number of languages have two 1st person plural pronouns. For example, in Indonesian, "kita" has the same coverage as English "we". The second pronoun, "kami", however, explicitly **excludes** the addressee(s):

        kami = lumi     1+3, speaker plus one or more others who are not
                        present, but NOT the addressee(s)

Pronouns which include the addressee(s) are called *inclusive*, while pronouns which exclude the addressee(s) are called *exclusive*.

Some languages (e.g. Cambodian and several languages of New Guinea) even have versions of 3rd person pronouns that are unspecified for number, as well as 2+3 forms. The system presented here allows us to create any of these pronouns with total regularity and with whatever degree of precision (or lack of precision) that we need.

Some languages have dual (= exactly 2), and a few languages even have trial (= exactly 3), and paucal (= a few) forms of their personal pronouns. We will not create special words for these in the interlingua because they are rare. If necessary, however, we can modify the pronoun with a numeric word:

        Dual:   femi femu = 'the two of you', 'you two'
        Trial:  femi gimu = 'the three of you', 'you three'
        Paucal: femi fomu = 'the few of you'

Verb forms, by default, will be P-s verbs having meanings 'to be X'. The verb "mida" would mean 'to be me' (e.g. "Mida the culprit" = 'The culprit is me') and "poyda" would mean 'to be mine' (e.g. "The pencil poyda" = 'The pencil is mine').

Adjectival forms could be used to handle expressions such as "You boys" in "You boys better behave yourselves", where 'You' would be "femido" and would modify the noun meaning 'boys'.

Adverbial forms will have English translations that use "being", as in "Being yours, the car is probably a piece of junk", where "being yours" would be represented by "fepoyde".

Open nouns, open adjectives, and open previous-word modifiers are meaningless because deictics are inherently unfocused.

Other verb forms can be used to represent such concepts as P-d "misyu" = 'to become mine', A/P-d "femivyu" = 'to make P yours', etc. <span id="S10_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 10.2 Demonstratives

For demonstratives, we will use the same initial semi-roots as for personal pronouns, plus the root-terminator "-pe":

        1:      --
        2:      fe-
        3:      gi-
        1+2:    jo-     Dem:    -pe    P-s adjective by default
        1+3:    lu-
        2+3:    ba-
        1+2+3:  ze-

Here are the English equivalents:

        this    = pe
        that    = fepe
        yon     = gipe

Normally, the plural prefix "ni-" should be applied to the head noun, rather than to a demonstrative adjective. For example, "nicabodi pe" means 'these ducks'. However, "ni-" can be applied to a demonstrative noun, as in "I like nipedi" = 'I like these'.

Since demonstratives often have strong locative implications, it will not be very useful to interpret the compound forms, such as 2+3, as 'that' **and** 'yon'. Instead, we will interpret it as 'that' *or* 'yon'. Thus, if we do not want to make the 'that/yon' distinction, we can use the 2+3 forms:

        that  = bape

Some languages have other versions. For example, 1+2 demonstratives are found in Sre (Vietnam) and Chibemba (Africa). I do not know of any language that has a 1+3 demonstrative.

The basic verb forms can represent P-s concepts such as 'is this (one)' and 'are those'. For example, "The boat peda" would mean 'The boat is this one'.

Other verb forms can also be useful ('to become this entity', 'to make something into that entity', etc.). For example, the A/P-d version of the 3rd person demonstrative, "gipevyu", would be used to represent "to turn ... into that" in a sentence such as "I TURNED the scrap lumber INTO THAT". <span id="S10_3"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 10.3 Locative Deictics

For locatives, we will use the same semi-roots as for personal pronouns, plus the root-terminator "-paw":

        1:      --
        2:      fe-
        3:      gi-
        1+2:    jo-     Loc:    -paw    "0" adverb by default
        1+3:    lu-
        2+3:    ba-
        1+2+3:  ze-

Here are the English equivalents:

        paw     = here
        fepaw   = there (near listener)
        gipaw   = over there, yonder

If you do not want to make the 'there/yonder' distinction, use the 2+3 forms, as we did for demonstratives:

        there   = bapaw

The 1+2+3 form implies 'here or there or yonder', or simply 'somewhere'. The 1+3 form means 'here or over there'.

The basic verb forms can represent such concepts as 'here is', 'there are', etc. For example, the P-s verb "pawda" would mean 'here is' or 'to be here' in a sentence such as "Here's Bill" or "The books you want are here". However, English speakers should be careful not to confuse the 2nd + 3rd or 3rd person deictic constructions with the P-s verb ["zizada"](#to_be), discussed earlier, which does not refer to a particular location. Consider the following:

        gipawda: There are the books you wanted.
        zizada: There are people who actually like him.

Adjective forms are also useful, as the following examples illustrate:

        gipaw:    I saw Sally over there (= I was over there when
                    I saw her).
        gipawdo:  I saw Sally over there (= the Sally standing
                    over there right now).
        gipawdo:  The man over there married my sister.

In the last two examples, the adjective "gipawdo" modifies the nouns "Sally" and "man".

Other verb forms can also be useful ('to get here', 'to keep there', 'to put over there' etc.). For example, the A/P-s verb "gipawvya" would be used to mean 'to keep over there' in a sentence such as "We keep the plants over there during the winter". Also, the AP-d verb "pawkyu" means 'to come' (literally: 'to cause oneself to become here'), and the AP-s verb "pawkya" means 'to stay here' or 'to tarry'.

Finally, do not confuse deictic locatives with state adverbs such as "near/nearby", "far/far away/far off", etc. The adverb forms often appear to be used deictically, but this is simply because the contextual referent is sometimes the location of the speaker. There are other times, however, when the referent is **not** the speaker:

        Referent is the speech location:
            John lives nearby. (= near here)

        Referent is NOT the speech location:
            When I rented that cheap apartment in Boston, John lived
                nearby. (= near the apartment)

        Compare the above with "John lives here" vs. "When I rented that
                cheap apartment in Boston, John lived here".

In other words, when using an unfocused version of an inherently focused concept, we must supply a default based on context, and sometimes the default referent will be the speaker's location, but not always. It is important to keep in mind that true deictics are inherently **unfocusable** because the referent is **always** determined by the speech act. <span id="S10_4"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 10.4 Temporal Deictics

For temporal deictics, we will use the same semi-roots as for personal pronouns, plus the root-terminator "-may":

        1:      --
        2:      fe-
        3:      gi-
        1+2:    jo-     Tem:    -may    "0" adverb by default
        1+3:    lu-
        2+3:    ba-
        1+2+3:  ze-

I will also adopt the following person/time mappings:

        1:      present
        2:      past
        3:      future
        1+2:    past, same time unit
        1+3:    future, same time unit
        2+3:    (unassigned)
        1+2+3:  (unassigned)

Here are some English equivalents:

        now                       = may
        earlier, already          = femay
        later                     = gimay
        currently, nowadays       = nimay

Note that the above derivations are true deictics. Thus, they cannot be used in a sentence such as "John arrived at 3, but Bill arrived much earlier". Since "earlier" in the example is not relative to the moment of speech, it is not a true deictic. It is simply a temporal state relationship whose referent must be determined from context. (In fact, we derived this word when we discussed [temporal case tags](#S4_3_5). The word is "pasoyde", meaning 'earlier' or 'previously'.)

We can also use polarity prefixes to refine the meanings:

        bimay = right now, immediately, at this very moment
        lamay = about now
        fofemay = a little while ago
        xegimay = a long time from now

and so on. <span id="ago_from_now"></span>

Languages also have deictics that refer to specific time periods, such as 'today', 'tomorrow', and 'yesterday'. For these, we can modify the deictic adverb by a previous-word modifier version of the measure word. Here are some examples:

        xezidi - 'day'

        today           =  may-xeziday      present + 'day'
        yesterday       =  femay-xeziday    past + 'day'
        tomorrow        =  gimay-xeziday    future + 'day'
        earlier today   =  jomay-xeziday    past, same time unit +
                                                      'day'
        later today     =  lumay-xeziday    future, same time unit +
                                                      'day'

If we use numeric multipliers, we can indicate precise temporal distances from the present time. Here are some examples:

        day before yesterday    = femay-xeziday-femuday
                                = 'earlier' + '2 days'

        day after tomorrow      = gimay-xeziday-femuday
                                = 'later' + '2 days'

        three days ago          = femay-xeziday-gimuday
                                = 'earlier' + '3 days'

        twenty-three days from now
                                = gimay-xeziday-fegimuday
                                = 'later' + '23 days'

        many days ago           = femay-xeziday-xemuday
                                = 'earlier' + 'many days'

        in a few days           = gimay-xeziday-fomuday
                                = 'later' + 'few days'

And so on.

We can extend this approach easily to handle expressions such as "tonight" = present + 'day' + 'night', tomorrow night = future + 'day' + 'night'. \[Keep in mind that "xezi" = 'day' refers to a 24 hour period. It does **not** refer to the concept of 'daytime'.\]

Prefixes (plural, etc) and polarity semi-roots may **not** be used when the deictic is modified by a measure word. <span id="S11_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 11.0 Articles

Articles in English are used to indicate whether a noun phrase refers to an entity which is being newly entered into the discourse or which has already been mentioned or is known from context. A definite article (e.g. English "the") is typically used when the noun phrase refers to a specific entity that is already known to both the speaker and listener. An indefinite article (e.g. English "a/an" or "any/some") is generally used when the entity is being introduced for the first time. Compare "An old man entered the room" with "The old man entered the room".

Articles are not always used in the same way from one language to another. For example, there are many cases where an English definite article will be used where French will use an indefinite article or no article at all. In fact, I doubt very much if there are two languages that always use articles in exactly the same way. The rules involving their use are always language-dependent. Because of this, it is important that we define exactly what we mean by the term "article". For the interlingua, here is the definition that we will use:

        A definite article indicates that the corresponding noun phrase
        refers to an entity that is already known to both speaker and
        listener; i.e., it is either known from context or has been
        previously mentioned.  An indefinite article indicates that the
        corresponding noun phrase refers to an entity that is being newly
        added to the existing context.

Many languages do not have unique words or morphemes to represent articles (e.g. Chinese, Swahili, Turkish, Hindi, Japanese, and many others). Some have only one or the other, but not both (e.g. Arabic has only a definite article, while Persian has only an indefinite article). However, when articles are not available in a language, word order (e.g. Russian) or verb-marking (e.g. Swahili) can sometimes distinguish between definiteness and indefiniteness.

Fortunately, we will not need to allocate new words for articles, because we already have ideal solutions for both.

The indefinite article is simply the true generic derivation "ma" which we discussed earlier in the chapter on [Simple Generics](#S7_0). Here are the relevant examples again:

        Generic adjective "ma" - 'a/an/some (singular)', some (plural)

            e.g.    We need AN empty box.
                    SOME jerk just blocked my car.
                    SOME people are at the door.

The semantics of "ma" perfectly overlap our definition of the indefinite article.

The negative indefinite article "buma" is also available:

        "buma" - 'no', 'not'
                e.g.  NO man left these footprints.
                      I saw Bill but NOT John.

A perfect choice for the definite article is the 1+2+3 demonstrative, "zepe". (Note that demonstratives are inherently definite.) Cambodian does something very similar to this. It has a word that can mean any of 'this', 'these', 'that', or 'those', and corresponds exactly to the word "zepe" in the interlingua. It is normally translated into English as 'the'.

There will be times when it will be necessary to use "zepe" plus the indefinite article "ma" or the negative indefinite article "buma". Here's an example:

        I saw carpenter but buma zepe plumber
        = I saw the carpenter but not the plumber.

If we did not use "zepe" with "plumber", then we would have had:

        I saw carpenter but buma plumber
        = I saw the carpenter but no plumber.

Note that "buma" and "ma" should never be used together. <span id="generic"></span>

Now, there is also a third category of definiteness: generic. Here are some examples in English:

        Tigers live in India.
        I don't like ice cream.

In the above examples, "tigers" and "ice cream" are generic, because they do not refer to specific entities, whereas definite and indefinite nouns always refer to specific entities.

In the interlingua, we will mark genericity by using the generic noun prefix "nu-". Thus, we can implement the examples above by prefixing "nu-" to the words meaning 'tiger' and 'ice cream'. English achieves the same effect by omitting an article and making the headword plural. Also, in noun-noun compounds, the modifying noun is always assumed to be generic; e.g. "meat eater", "gold mine", "door knob", etc. In the interlingua, these modifying nouns will be prefixed by "nu-". \[We'll have more to say about compounding [later](#S22_0).\]

As we discussed earlier, the word ["madi"](#S7_0) means 'something' or 'anything'. Since it always introduces a new referent into the conversation, it is inherently indefinite. If we make it generic, we get the general sense of the English word "things". Here are some examples:

        numadi = 'things'
        e.g. "Why do you have to make things so complicated?"

        numadi bimu = 'all things', 'everything'
        e.g. "Everything must come to an end."

        numadi xemu = 'many things', 'a lot of things'
        e.g. "I know many things that you don't know."

And so on. <span id="default_generic_def"></span>

In the interlingua, all noun phrases will be definite by default. Use "ma" or "buma" to mark a phrase indefinite, and the prefix "nu-" to mark the phrase generic. Here are some examples:

        Nulovay is fun = Working is fun
        Lovay was fun  = The work was fun.
        I saw lovay ma = I saw some work.

            [Note that "loda" is the verb meaning 'to work/labor' and
            "-vay" is the process suffix that we discussed earlier.]

        I read book    = I read the book. (definite by default)
        I read ma book = I read a book. (indefinite)
        I read nu+book = I read books. (generic)

        I read nimu book = I read the three books. (definite by default)
        I read ma three books = I read three books. (indefinite)

In summary, there is no need to create special words to represent articles in the interlingua. Instead, we will use the 1+2+3 demonstrative "zepe" to explicitly mark definiteness (on the rare occasion when it is needed), we will use the true generic word "ma" to explicitly indicate indefiniteness, and we will use the prefix "nu-" to indicate genericity.

Finally, there will be times when the definiteness of a noun phrase is not known. This will **never** happen when two people are speaking the language, but **may** happen when a computer is translating from a natural language to the interlingua. When a machine translation program cannot determine the definiteness of a noun phrase in the source language, it should modify the noun with the particle "cimwa". This word is a particle that will behave syntactically like an adjective. <span id="S12_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 12.0 Comparatives

Unlike basic verbs, comparatives do not represent true states or actions. Instead, they indicate the **relative** magnitudes of two or more states or the **relative** quantities of two or more entities. In a sense, they are somewhat like deictics, since they do not represent exact states or entities. Unlike deictics, though, they do not index or point to exact states or entities. Instead, they simply position one referent with respect to another along a one-dimensional scale:

        John        John        John        John        John
        is          is          is          is          is
        least       less        happy       more        most
        happy       happy                   happy       happy

        |           |           |           |           |
        V           V           V           V           V

        o-----------o-----------o-----------o-----------o
     Absolute                                        Absolute
     Minimum                                         Maximum

Now, the interpretation of comparatives will depend on the nature of what is being compared. Earlier, when we discussed [Counts and Measures](#S9_0), we made an important distinction between counts which were explicitly linked to an argument of the verb, and those which were not linked, but which modified the verb directly. Thus, a numeric P-s adverb had the meaning 'being N in quantity' when it linked to a noun, while the verb-modifying "0" form had the meaning 'being N in frequency'. Comparatives behave in the same way.

However, count words have specific numeric values, whereas comparatives have the very vague meaning of 'relative magnitude'. Thus, when a count modifies a verb, it can only indicate a frequency; i.e. a number or a count of discrete events. A comparative, however, is more general and can be interpreted as either degree, duration, or frequency. Consider the following examples:

            degree          -> Fish stinks more than beef.
            duration        -> John studied more than Bill.
            frequency       -> He complained more than I did.

Note, though, that these are the most likely interpretations in English, and can change depending on context. Also, when necessary, it is possible to explicitly indicate the desired interpretation:

            degree          -> Fish stinks stronger than beef.
            duration        -> Fish stinks longer than beef.
            frequency       -> Fish stinks more often than beef.

            degree          -> John studied harder than Bill.
            duration        -> John studied longer than Bill.
            frequency       -> John studied more often than Bill.

            degree          -> He complained more vehemently than I did.
            duration        -> He complained longer than I did.
            frequency       -> He complained more often than I did.

And yet, when you look more closely, the most likely "more than" default interpretation actually includes all three non-default interpretations. For example, the sentence "John studied more than Bill" could be interpreted as "John studied harder, longer, and/or more frequently than Bill". In other words, when a "more than" comparative is used with verbs, it can indicate any or all of the three concepts of 'degree', 'duration', or 'frequency'. However, the nature of the verb and the context in which it is used may favor one interpretation more than another.

Natural languages implement comparative constructions in several different ways. Here are some examples of the major types:

        1. The 'from' comparative (e.g. Classical Arabic, Hindi,
           Japanese, Eskimo, Quechua, Turkish, Burmese):
                A horse is big FROM a mouse.
                = A horse is bigger than a mouse.
        (In these constructions, "from" is the same word or affix used
        in a sentence such as "He drove FROM Boston to New York".)

        2. The 'to' comparative (e.g. Breton, Maasai, not very common):
                A horse is big TO a mouse.
                = A horse is bigger than a mouse.
        (In these constructions, "to" is the same word or affix used in
        a sentence such as "He drove from Boston TO New York".)

        3. The 'more' plus 'on' comparative (e.g. Navaho, Tamil, not very
           common):
                A horse is MORE big ON a mouse.
                = A horse is bigger than a mouse.
        (In these constructions, "on" is the same word or affix used in
        a sentence such as "He put the book ON the table".)

        4. Comparatives that use opposites or negatives (e.g. Motu,
           Dakota, Samoan, Nahuatl.  This method is very common, but is
           limited to relatively obscure languages.):
                A horse is big, a mouse is not big.
                  OR  A horse is big, a mouse is small.
                = A horse is bigger than a mouse.

        5. Comparatives formed regularly (typically from verbs) meaning
           'to be more in degree', 'to be equal in degree', and 'to be
           less in degree' (e.g. Chinese, Hausa, Swahili, Vietnamese,
           Yoruba, Cambodian):
                A horse is big SURPASSING a mouse.
                = A horse is bigger than a mouse.

        6. Comparatives that use special particles (e.g. Hungarian,
           Russian, Malagasy, English, Basque, Javanese.  A large
           majority of the languages in this group are European.)
                English: A horse is bigger THAN a mouse.
                Javanese: A horse is big MORE-THAN a mouse.

The first four methods are essentially metaphoric or idiosyncratic, and I will say no more about them. The fifth method can be very complex because different forms are needed depending on the syntax of the construction.

The sixth method, however, is the simplest, and is the method that we will use in the interlingua. However, the sixth method can at times be ambiguous, which we cannot tolerate in an interlingua intended for use in machine translation. Thus, we must design the system such that there can be no ambiguities.

Before proceeding, however, and in order to get an idea of how to most effectively and unambiguously implement these comparatives, let's look at a few examples that vary only slightly, and see if we can make some generalizations about them (I will use parentheses plus the English particle "more" to show which item is greater in quantity or degree):

        John reads novels more than Bill.
        John (more reads) novels vs. Bill reads novels
        i.e., different verbs, different subjects, same objects

        John reads novels more than short stories.
        John (more reads) novels vs. John reads short stories
        i.e., different verbs, same subjects, different objects

        John reads more novels than Bill.
        John reads (more novels) vs. Bill reads novels
        i.e., same verbs, different subjects, different objects

        John reads more novels than short stories.
        John reads (more novels) vs. John reads short stories
        i.e., same verbs, same subjects, different objects

In other words, there are three constituents (verb, subject, and object) which can have either of two values (same or different). This suggests that there could be up to eight possible combinations. Here is a list of all of the possibilities:

        1. same verb, same subject, same object
        This is not a comparison since nothing is different.

        2. same verb, same subject, different object
        John reads more novels than short stories.
        John reads (more novels) vs. John reads short stories

        3. same verb, different subject, same object
        More women read novels than men.
        (more women) read novels vs. men read novels

        4. same verb, different subject, different object
        John reads more novels than Bill.
        John reads (more novels) vs. Bill reads novels

        5. different verb, same subject, same object
        John writes novels more than he reads them.
        John (more writes) novels vs. John reads novels

        6. different verb, same subject, different object
        John reads novels more than short stories.
        John (more reads) novels vs. John reads short stories

        7. different verb, different subject, same object
        John reads novels more than Bill.
        John (more reads) novels vs. Bill reads novels

        8. different verb, different subject, different object
        John reads novels more than Bill writes short stories.
        John (more reads) novels vs. Bill writes short stories

        Note that when everything is different, it is really a simple
        comparison between two sentences.

In the interlingua, we will implement these ideas by creating two types of word: several comparative modifiers derived using the [polarity semi-roots](#S8_1) discussed earlier, and a single comparative conjunction. By default, the modifiers will be P-s previous-word modifiers:

        bimwa  = 'most'
        xemwa  = 'more'
        lamwa  = 'as much/many'
        fomwa  = 'less/fewer'
        zumwa  = 'least'
        mwaki  = 'how (much)', 'to what degree'

Forms using the negating prefix "no-" are also useful:

        noxemwa = 'not more than', 'at most'
        nofomwa = 'not less than', 'at least'

And here is the comparative conjunction:

        tupye  = 'than', 'as', 'compared with/to'

The conjunction will be a "true conjunction", meaning that it must link two constituents that have the same part-of-speech and which are inherently comparable. For example, we can compare "apples" with "oranges", but we cannot compare "apples" with "John reads books", unless metaphor is being used. \[We'll have more to say about [true conjunctions](#S21_0) and [metaphor](#S27_0) later.\]

The interrogative modifier "mwaki" can be used in expressions such as "How heavy is the box?" or "How generous is Bill compared to John?".

The superlative modifiers "bimwa" and "zumwa" cannot be used with "tupye" since they do not really compare two different constituents, and the use of a conjunction would be incorrect. For example, in the sentence:

        John was the tallest student at the party.

we are not really comparing "John" with "the party", since they are inherently incomparable. In order to represent this meaning, we will do as is done is many natural languages, including English:

        John was tall bimwa student pyo party.

where ["pyo"](#at_in) is the locative case tag we discussed earlier.

\[Keep in mind that "bimwa" is a previous-word modifier and must **follow** the word it modifies, even though we are using English word order for the rest of the example.\]

When a comparative modifier modifies a countable entity, it will always have a quantitative interpretation. In all other cases, it will have the vaguer degree/duration/frequency interpretation.

To obtain a more precise interpretation, we can modify an attribute of a non-countable entity:

        This room tupye that room is_hot xemwa
        = This room is hotter than that room.
        [Where "is_hot" is the verb "jinxeda".]

        This room tupye that room is_hot often xemwa.
        = This room is hot more often than that room.

It's important to emphasize that, when modifying countable entities, a comparative modifier will have a quantitative interpretation. For example, "bonxedi xemwa" means 'more heavy ones', and **not** 'the heavier one'. To obtain the second sense, we can modify the noun "camudi" (meaning 'one', 'unit', or 'item') by "bonxedo xemwa".

Now, let's look at some more examples:

        1. John is taller than Bill.
        = John tupye Bill is_tall xemwa.

        2. John is as tall as Bill.
        = John tupye Bill is_tall lamwa.

        3. John is less tall than Bill.
        = John tupye Bill is_tall fomwa.

        4. John is not as tall as Bill = John is less tall than Bill.  =
        John tupye Bill is_tall fomwa.

        5. John is the tallest.
        = John is_tall bimwa.

        6. John is more quiet than shy.
        = John is_quiet xemwa tupye he is_shy.

        7. John helps Bill more than he helps Mike.
        = John helps xemwa Bill tupye Mike.

        8. John helps Bill more than Mike does.
        = John tupye Mike helps xemwa Bill.

        9. More kids join gangs in Boston than Cowtown.
        = Kids xemwa join gangs in Boston tupye Cowtown.

        10. Kids join gangs in Boston more than Cowtown.
        = Kids join xemwa gangs in Boston tupye Cowtown.
      or
        = Kids join xemwa gangs in Boston tupye in Cowtown.

        11. John reads novels more than Bill.
        = John tupye Bill reads xemwa novels.

        12. John reads more novels than Bill.
        = John tupye Bill reads novels xemwa.

        13. John reads novels more than short stories.
        = John reads xemwa novels tupye short stories.

        14. John reads more novels than short stories.
        = John reads novels xemwa tupye short stories.

        15. John most reads novels  or  John reads novels the most.
        = John reads bimwa novels.

        16. John reads the most novels.
        = John reads novels bimwa.

        17. John is more of a fighter than Bill.
        = John tupye Bill is xemwa a fighter.
        [Note that we must modify "is", not "Bill".]

        18. John is more of a whiner than a fighter.
        = John is xemwa a whiner tupye a fighter.

        19. John likes taller girls than Louise.
        = John likes tall xemwa girls tupye Louise.

        20. John had more money than Bill thought (he had).
        = John had money xemwa tupye what Bill thought (he had).
        [Note that we must use the headless relative "what" because the
        conjunction "tupye" can only link constituents with the same
        part-of-speech.  We'll have more to say about headless relatives
        later.]

        21. John baked more pies than Bill told him to (bake).
        = John baked pies xemwa tupye what Bill told him to (bake).

        22. More people stayed late than left early.
        = People xemwa stayed late tupye left early.
        [Note that "left" here must use the infinitive suffix
        "-vi" because its subject is the same as "stayed".]

        23. John can run faster than Bill.
        = John tupye Bill can run fast xemwa.

        24. You can buy a less expensive car here than at other
        places.
        = You can buy an expensive xemwa car here tupye at other dealers.
        [Note that "here" is the adverb "paw" and "at" is the case
        tag "pyo".]

        25. John can kick a football farther than Bill.
        = John tupye Bill can kick a football far xemwa.

When the conjunction "tupye" is not used, the item it links to will be known from context. For example, "I need xemwa water" = 'I need more water (than I currently have)' or "I need xemwa water this time" = 'I need more water this time (than last time)'.

Noun versions can also be used. For example, "I need xemwadi" means 'I need more'.

When "xemwa" or "fomwa" modifies a specific numeric, the result will have the meaning 'more than N' or 'less than N':

        I have three xemwa books
        = I have more than three books.
        [Again, keep in mind that "xemwa" is a previous-word modifier,
        and it modifies "three" - not "books"!]

Earlier, we discussed what happens when we [focus scalar states](#focus_scalars) that are inherently unfocused. Here is an example:

        The rope is 6 meters long.
        = The rope is_long 6 meters.

where "is_long" is the P/F-s verb "layxesa".

In other words, the focus indicates the degree of the state.

Now, here is an example of a comparative "-d" derivation:

        They lengthened the rope by 6 meters.
        = They made_longer the rope 6 meters.

where "make_longer" must be an A/P/F-d verb.

Now, to create the comparative sense 'longer' from the absolute sense 'long', all we need to do is the following:

        layxedo = P-s adjective 'long'
        layxevu = A/P/F-d verb 'to cause P to become length F'
        layxevu xemwa = A/P/F-d verb 'to cause P to become longer by F'

Note that we cannot use a polarity semi-root on the verb to achieve the same thing, because that has a different meaning:

        xelayxevu = A/P/F-d verb 'to cause P to become a very long F'
          e.g. He made the rope a very long 6 meters.

Note that the above does not imply at all that the rope was shorter before he set its length to a "very long" 6 meters. <span id="S12_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 12.1 Unfocused Comparatives

Natural languages have several words which indicate degree or quantity relative to an **implied** referent. In other words, these words have an unspecified focus. Here are some English examples:

        Excessive degree:
                He is TOO happy now.
        Maximum degree:
                He is SO/TOTALLY/MOST happy now.
        High degree:
                He is QUITE/VERY/EXTREMELY happy now.
        Low degree:
                He is NOT TOO/SLIGHTLY/SOMEWHAT happy now.
        Minimum degree:
                He is HARDLY/BARELY happy now.
        Zero degree:
                He is NOT AT ALL happy now.
        Slightly less than unmarked degree:
                He is ALMOST/NOT QUITE happy now.
        Exclusive degree:
                He is JUST/ONLY going to the library.
        Exact degree:
                He bought EXACTLY/PRECISELY seventy-two pencils.
        Approximate degree:
                He bought APPROXIMATELY/ABOUT seventy pencils.

Note that the maximum, high, low, minimum, and zero degrees are already represented by the scalar polarity semi-roots. Additional semi-roots can be created for the other degrees. Here is the complete list that we will use in the interlingua:

        bi-   maximal polarity
        xe-   high polarity
        la-   average polarity
        fo-   low polarity
        zu-   minimal polarity
        bu-   0% polarity
        fin-  too, excessively, over-
        ge-   enough, adequately, sufficiently
        zay-  almost, not quite, nearly, all but, well-nigh
        to-   just, only, exclusively, simply
        ci-   about, approximately, circa, more or less
        zi-   exactly, precisely, no more and no less

Now, we can form complete words with these semi-roots by using them with the true generic root "ma". The results will be P-s previous-word modifiers by default. Here are a few examples:

        previous-word modifiers:

            He likes bima Louise.
            = He likes Louise SO MUCH.
            He likes buma Louise.
            = He does NOT like Louise AT ALL.
            He's a happy xema person.
            = He's a VERY happy person.
            He studies when toma she's here.
            = He studies ONLY when she's here.
            When she's here, he studies toma.
            = When she's here, he JUST studies.
            He is a poet toma (and nothing else).
            = He's JUST a poet (and nothing else).
            He studies xema.
            = He studies VERY MUCH/A LOT.
            He studies finma.
            = He studies TOO MUCH.

        verbs:
            His understanding zumada.
            = His understanding IS MINIMAL.
            The music lamada.
            = The music IS SO-SO.
            The volume finmada.
            = The volume IS EXCESSIVE.
            The measurements cimada.
            = The measurements ARE APPROXIMATE.
            The problem xemada.
            = The problem IS LARGE/GREAT.

It's important to emphasize that the polarity semi-roots indicate degree or general magnitude. They do **not** indicate quality or quantity. Thus, they are most useful when modifying states or actions. When modifying physical entities, they are likely to be ambiguous.

Here are some adjective derivations:

        bimado         = maximum, maximal, utmost, greatest, highest,
                           uppermost
        xemado         = great (eg. intellect), intense (eg. color),
                           high (eg. temperature), strong (eg. smell),
                           keen (eg. eyesight), acute (eg. hearing),
                           superior, considerable, substantial, etc.
        lamado         = so-so, average, typical, common, usual,
                           ordinary
        fomado         = low, weak, mere, meager, inferior, slight
        zumado         = minimum, minimal, lowest, weakest, negligible,
                           inconsiderable, inconsequential, trifling
        finmado        = excessive, overrated, overblown, etc.

When "bima" modifies an adverb, an adjective, or an adjectival verb (i.e., a verb derived from an English adjective, such as "jinxeda" = 'to be hot'), it is equivalent to the English expression "as X as possible". For example, if "kanxekoy" means 'quickly', then "kanxekoy bima" means 'maximally quickly' = 'as quickly as possible'.

Finally, keep in mind that scalar non-relational states can use the polarity semi-roots productively. In other words, they can be added directly to the root rather than require a separate modifying word. For example, "xejinxe" = "jinxe xema" = 'very hot'. <span id="S12_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 12.2 More Complex Comparatives

We often make comparisons in which we specify the magnitude of the difference between the entities being compared. Consider the following:

        1. The rope is longer than the stick.
        2. The rope is half as long as the stick.
        3. The rope is less than half as long as the stick.
        4. The rope is three meters longer than the stick.

We've already seen how to deal with (1). The others can be most easily implemented by simply focusing the verb:

        2. The rope layxesa gofemu stick.
        = The rope is as long as half the stick.
        = The rope is half as long as the stick.

        3. The rope layxesa fomwa gofemu stick.
        = The rope is less long than half the stick.
        = The rope is less than half as long as the stick.

        4. The rope layxesa the stick and three meters.
        = The rope is as long as the stick and three meters.
        = The rope is three meters longer than the stick.

where "layxesa" is the P/F-s verb meaning 'to be as long as', and "gofemu" is the numeric adjective meaning 'one-half'.

We can also easily add a comparative to the verb, creating a double comparative:

        The rope layxesa xemwa the stick and three meters.
        = The rope is longer than the stick and than three meters.
        = The rope is more than three meters longer than the stick.

Note that none of the above solutions require the comparative conjunction "tupye". However, solutions with "tupye" are also possible. Here's the solution for (2):

        The rope tupye gofemu stick layxeda lamwa.
        = The rope compared with half the stick is as long.
        = The rope is as long as half the stick.
        = The rope is half as long as the stick.

where "layxeda" is the P-s verb meaning 'to be long'.

Here is the solution to (3):

        The rope tupye gofemu stick layxeda fomwa.
        = The rope compared with half the stick is less long.
        = The rope is less long than half the stick.
        = The rope is less than half as long as the stick.

But how do we handle (4), where the difference is not only additive, but also contains the unit of measure "meters"? Here's the answer:

        The rope tupye the stick and three meters layxeda lamwa.
        = The rope compared with the stick and three meters is as long.
        = The rope is as long as the stick and three meters.
        = The rope is three meters longer than the stick.

We can also easily add a comparative to the verb, creating a double comparative:

        The rope tupye the stick and three meters layxeda xemwa.
        = The rope compared with the stick and three meters is longer.
        = The rope is longer than the stick and three meters.
        = The rope is more than three meters longer than the stick.

Thus, in effect, "tupye" acts like an oblique focus marker. <span id="S13_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 13.0 Diminutives and Augmentatives

We've seen how useful the polarity semi-roots can be in deriving many new words. So far, though, we've only applied them to stative (i.e. adjectival) concepts. Fortunately, they can be just as useful and productive when applied to nouns. In doing so, we will be creating words that are commonly known as *diminutives* and *augmentatives*. (Diminutives are also sometimes referred to as *attenuatives*).

In the interlingua, the semantics of diminutives and augmentatives is defined as follows:

        When a polarity semi-root is used with a basic noun, it magnifies
        or reduces the SIZE, INTENSITY, and/or QUALITY of the entity, in
        proportions that are most natural or typical for the entity.
        While the nature of the result may be quite different from the
        root concept, the class will remain the same.

As you can see, even the definition is not semantically precise. Thus, as always, we will use the semi-roots for their mnemonic value.

For easy reference, here are the basic polarity semi-roots again:

        bi-     maximally, extremely, utmost
        xe-     very, highly, so, so much, such
        la-     midpoint, average, so-so
        fo-     not too, not very
        zu-     minimally, barely, hardly

Now, here are a few examples:

        batondi = 'snowfall'
            bibatondi = 'blizzard', 'whiteout'
            xebatondi = 'snowstorm'
            zubatondi = 'snow flurries'

        cudi = 'lake'
            xecudi = 'great lake'
            lacudi = 'pond'
            focudi = 'pool (natural)', 'water hole'
            zucudi = 'puddle'

        konmendi = 'school'
            bikonmendi = 'university'
            xekonmendi = 'college'
            lakonmendi = 'high/secondary/middle school'
            fokonmendi = 'elementary/primary/grade school'
            zukonmendi = 'kindergarten', 'preschool', 'nursery school'

We can also use these semi-roots to indicate quality. For example, we can use them to make distinctions such as between "palace", "mansion", "house", and "hovel".

In summary, we will be able to use the complete set of scalar polarity semi-roots to create augmentatives and diminutives based on degree or quality. It's important to keep in mind, though, that these derivations are not productive, and cannot be used to create makeshift or ad hoc words. Any such words must have unique dictionary entries. <span id="S14_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 14.0 Register Variations (Honorifics and Pejoratives)

Many languages have words or morphemes that indicate the social status of the speaker relative to the listener or to a third party. The most common way of marking these differences is by means of special pronouns. For example, a more polite 2nd person pronoun can be used when speaking to a superior or elder.

However, these distinctions are not only made with pronouns. There are also many words, other than pronouns, that are only used in certain social contexts. For example, most English speakers will use the words "shit", "crap", "feces", "do-do", and "number 2" in entirely different settings, depending on who they are speaking with. In fact, some speakers will completely avoid using certain words, either because they are too formal or too rude. For example, many speakers will not use the 'dirty' word "shit" at all, while others may not use 'big' words like "explicate" or "obfuscation", or 'pretty' words like "lovely" or "marvelous".

Some languages also have words that differ in register that are effectively **required** in certain contexts. Cambodian is a language that is especially rich in this respect. For example, there are three completely different words that mean 'to sleep'. The first is used when the sleeper is a superior or someone especially deserving of respect; the second is used when the sleeper is the speaker or a person of equal status; and the third is used when the sleeper is of lower status.

Words or morphemes that indicate respect are normally called *honorifics*, while those which indicate disrespect are called *pejoratives*.

In the interlingua, we will create special prefixes for honorifics, pejoratives, and other register variations. This approach is similar to the honorific affixes of Korean and Japanese, but is more comprehensive.

To illustrate this in the interlingua, we will create the following prefixes:

        naye-   humble, inferior, fawning, groveling, subservient
        nea-    praising, complimentary, flattering
        nye-    polite, respectful, formal
        --      neutral (default)
        newi-   slang, informal
        nyo-    cold, unfriendly, unsociable
        noa-    contemptuous, rude, insulting
        nayo-   vulgar, filthy, tasteless

<span id="S14_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 14.1 Lexical Register

The register prefixes can be applied to any word to indicate its social context. An unmarked expression would be interpreted as 'neutral', and would be used in the vast majority of cases.

Pronouns of varying degrees of politeness can be easily formed. For example, the 2nd person pronoun "femi", meaning 'you', would become:

        nyefemi = old English "ye", French "vous", German "Sie", etc.
        newifemi = old English "thou", French "tu", German "du", etc.

Nouns, verbs, adjectives, etc. can also have their register changed. For example, if the word for 'urine' is "jinxudi", then the word for 'piss' will be "noajinxudi".

As with all prefixes, a register prefix modifies the entire word that follows. For example, the word "noajinxu" means 'piss'. However, the word "noajinxusu" does **not** mean 'to become/turn into piss'. Instead, it simply means 'to become/turn into urine' spoken contemptuously. If we need to express the meaning 'to become/turn into piss', we must use the verb meaning 'to become" = "zizasu".

It is important to emphasize that the register prefixes always reflect the attitude of the speaker toward the entity that is being modified by the prefix. For example, if the 'contemptuous' prefix is used with the pronoun meaning 'you', it shows that the speaker feels contempt for the listener. If it is used with the pronoun 'I', it indicates that the speaker feels contempt for himself. If the 'humble' prefix is used with the pronoun 'you', it shows that the speaker feels humble in the presence of the listener. If it is used with the pronoun 'I', it indicates that the speaker feels humble in his **own** presence, as if he were in awe of himself or something he just did.

When used with a verb, the attitude is towards the patient.

Finally, the use of pejoratives is preferable to using metaphor (e.g. "dog" or "pig") since pejoratives are culturally neutral and will always be understood. \[I'll have more to say about the dangers of [metaphor](#S27_0) later.\] <span id="S14_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 14.2 Sentential Register

It will also be useful to apply register to complete utterances; i.e., by having a register word modify a complete sentence. In the interlingua, we will accomplish this by simply prefixing the first word of the sentence with an appropriate register prefix. Here are a few examples:

        1. Naye - May I leave now?      <- humble
        2. Nye - Can I watch TV?        <- polite
        3. Newi - I'm leaving now.      <- slang
        4. Noa - Why did you do it?     <- insulting

Example (1) would have the sense of the sentence "I humbly request permission to leave now", (2) is the same as "Please, can I watch TV?", (3) would be equivalent to "Hey, I'm splittin' now", and (4) would have the flavor of the English sentence "You louse! Why did you do it?". <span id="S15_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 15.0 Tense and Aspect

*Tense* marks the temporal location of an event as being either before, during, or after a particular reference time. For main clauses, the reference time is the moment of speech. For subordinate clauses, the reference time is the time of the outer clause. Here's an example:

        She told me that Bill had broken the window.

Here, the time of the main clause is relative to the moment of speech, while the time of the subordinate clause is relative to the time of the main clause.

Tense has three basic values: past, present, and future. However, natural languages often have additional tenses that are variations of the three basic tenses, such as 'immediate past', 'remote future', as well as different forms for relative tenses. *Aspect* marks the temporal 'shape' of the event, and whether the event is being viewed from the 'inside' or from the 'outside'. There are two general aspects that apply to all events, and several more specific ones. Here are the two general aspects:

        Perfect or Perfective:

                    The event is considered to be a single, bounded unit,
                    viewed from the outside; i.e., the event is completed.

            e.g.    Past:    In this report, we showed that...
                             John sang the song.
                    Present: In this report, we show that...
                             He catches the ball, swings around, and throws
                                    it...
                    Future:  In this report, we will show that...
                             John will sing the song.

        Imperfect or Imperfective:

                    The event is considered to be a range of points in time,
                    viewed from somewhere within the range; i.e., the event
                    is in progress.

            e.g.    Past:    John was singing the song.
                    Present: John is singing the song.
                    Future:  John will be singing the song.

    [The aspectual labels that I am using here are very common in the
    linguistic literature, but actual labels and their definitions vary
    somewhat from linguist to linguist.  Also, since the words "perfect" and
    "imperfect" have common, unrelated, non-aspectual meanings in English, I
    will often use their respective synonyms "perfective" and "imperfective"
    instead to prevent misunderstandings.]

In English, the combination of present and perfect is almost never used except in formal reports and, occasionally, in colloquial narration. Technically, the combination is not usually meaningful. If it were, it would imply that an event can be viewed as both complete and ongoing at the same time, which is almost always self-contradictory. Still, it does occasionally have its uses since it allows the speaker to treat an ongoing event as if it were complete.

Because of this, natural languages will often use the present perfect form for something else. English, for example, almost always uses the present perfect form to represent a present tense generic or habitual meaning (discussed below). For example, the use of "sings" in "He sings very well" means that he **habitually** sings very well. It does **not** mean that he is actually singing at the present moment.

A few languages, including English, also take advantage of certain, very common verb-tense-aspect combinations to achieve greater efficiency. For example, some verbs are almost always used with a perfective meaning in the past tense and an imperfective meaning in the present tense. Some languages will take advantage of this by using the perfect form all of the time if the perfect form is less marked (i.e. 'shorter') than the imperfect form. Here are some examples:

        Imperfective meaning, perfective form:
                John knows the answer.
                *John is knowing the answer.
                The book weighs 4 pounds.
                *The book is weighing 4 pounds.

        Perfective or imperfective meaning (depending on context),
        perfective form:
                John knew the answer.
                *John was knowing the answer.

        Imperfective meaning, perfective form:
                The fish stinks more than I can tolerate.
                *The fish is stinking more than I can tolerate.

        Perfective or imperfective meaning (depending on context),
        perfective form:
                The hat was too big.
                *The hat was being too big.

\[Note that all the verbs in this group are non-agentive "-s" verbs derived from state roots.\]

Because the English imperfective form using an auxiliary plus "-ing" is longer than the perfective form, and since only one meaning is likely, the more efficient perfective form is used instead without confusion. I suspect that this kind of crossover is only likely to occur in languages whose perfective forms are more efficient than their imperfective forms. However, it is not universal. In Turkish, for example, the less efficient but semantically correct imperfective form is used for verbs such as 'know'.

Keep in mind that use of the imperfective indicates that we are looking at a point in time within a range of points; in other words, we are viewing the event from the inside. Use of the perfective implies that we are looking at the event as if it were bounded; in other words, we are viewing it from the outside, as if it were a single point in time (although it could be a very "large" point).

Now, consider the following:

        Imperfective:   John was eating when Bill left.
        Perfective:     John ate when Bill left.

The first example is not bound and can potentially extend both before and after the tense time. It's even possible that John is still eating when the sentence is uttered. The second example *is* bounded. John was definitely not eating before Bill left, and was definitely not eating when the sentence was uttered. In other words, a perfective event can **not** extend outside of the boundaries imposed by the tense time. An imperfective event **can** extend beyond those boundaries.

There are several aspects that are more specific than the perfect or imperfect aspects. Here is a list of the most important ones:

     Iterative: The event is repeated more than once on a SINGLE occasion.

            Past:           John kept singing the song.
            Present:        John keeps singing the song.
            Future:         John will keep singing the song.

      Habitual: The event is repeated more than once on DIFFERENT
                    occasions.

            Past:           John used to sing the song.
            Present:        John sings the song (e.g. often).
            Future:         John will sing the song (e.g. from
                                    now on).

            Note that "sing" in the above examples is perfective by
            default.  We can also make it imperfective, as in "John used to
            be singing the song when ... etc".

      Inceptive: Only the start point of the event is under consideration.

            Past:           John started singing the song.
            Present:        John starts singing the song.
            Future:         John will start singing the song.

      Continuative: Only an internal point of the event is under
            consideration.

            Past:           John continued singing the song.
            Present:        John continues singing the song.
            Future:         John will continue singing the song.

      Terminative: Only a stopping point of the event is under
            consideration.

            Past:           John stopped singing the song.
            Present:        John stops singing the song.
            Future:         John will stop singing the song.

      Resumptive: Only a resumption point of the event is under
            consideration.

            Past:           John resumed singing the song.
            Present:        John resumes singing the song.
            Future:         John will resume singing the song.

            Do not confuse continuative with resumptive.  In English,
            "resume" is never ambiguous, but "continue" is sometimes used as
            a synonym for "resume".  Consider: "John resumed singing"
            vs. "John continues to shout even though I told him to stop".

      Completive: The event is done to completion, reaching a natural or
            obvious endpoint.  English generally uses the verb "to finish"
            or an expression such as "really" or "to completion" to indicate
            this aspect.

            Past:           John finished washing the dishes.
            Present:        John finishes washing the dishes.
            Future:         John will finish washing the dishes.

            Do not confuse "completeness" with "thoroughness".  Something
            may be finished without having been done thoroughly.

The above definitions are, I believe, the best ones possible for an AL designer because they cover those categories of aspect that appear in most natural languages. Categories that appear in very few languages, such as 'excessive duration', 'limited duration', 'frequentative', 'partial completion', etc. are not true aspects, but are actually modifications of existing aspects, and can be handled by using adverbs.

The inceptive, terminative, resumptive, and completive are all perfect by default. If we force them to be to be imperfect, we can obtain senses such as "John was starting to sing the song when ... etc". We'll see how to do this later on in this chapter.

In summary, tense describes the **external** temporal state of an event, while aspect describes the **internal** temporal state of an event.

Now, in the above list, I intentionally omitted the aspect usually referred to as *generic*. Here are some examples:

        Squirrels live in trees.
        Americans produce too much garbage.
        Sapphires cost more than diamonds.
        Dogs bark when the moon is full.

Many (and perhaps most) languages use the same form for both habitual and generic aspects. This is possible because the subject of a habitual is always definite:

        Generic:        Dogs bark when the moon is full.
        Habitual:       His dogs bark when the moon is full.

Keep in mind that "genericness" is really a property of a noun - **not** of a verb.

\[Incidentally, English also allows a definite article to appear with an indefinite noun, which can be confusing, as in "The elephant lives in Africa". Here, the context must make it clear whether the speaker means a particular elephant or elephants in general. The interlingua does not allow this ambiguity.\]

In English, the habitual is also often rendered with the words "always" or "all the time", as in "John always eats alone". In general, the habitual aspect should be used when referring to a series of events whose actual number is not relevant. The numeric derivation ["bumukoy"](#always), meaning 'always', (which we derived earlier in the chapter on [Counts and Measures](#S9_0)) should be used when the actual number of events *is* relevant. A good test for this is to paraphrase the sentence using the word "habitually". If the result is acceptable, then the habitual aspect should be used. Otherwise, the numeric derivation should be used. The numeric derivation should also be used whenever the speaker wants to emphasize that the event or situation occurred at every possible opportunity. <span id="S15_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 15.1 Implementing Tense and Aspect

Tense seems to be morphologically or lexically linked to aspect in most natural languages. In the interlingua, we will accomplish this by allocating roots that are mnemonically compositional, just as we did for deictics. In other words, tense and aspect words will be formed from true, unique root morphemes, but we will design them in a way that will display their inherent compositionality. Here are the details:

               Aspect                 Tense
        --------------------   --------------------
        Perfective:     jay-   Past:           -pa
        Imperfective:   kun-   Present:        -pi
        Iterative:      xwe-   Future:         -pu
        Habitual:       ji-
        Inceptive:      ca-
        Continuative:   fe-    Unspecified:    -maw
        Terminative:    bu-
        Resumptive:     gi-
        Completive:     jo-
        Unspecified:    lu-

By default, when not preceded by an aspect marker, "pa" will be past-perfect, "pi" will be present-imperfect, and "pu" will be future-perfect. "Maw" is discussed below.

Also, tense-aspect words take an entire clause as an argument, rather than just modifying the verb.

Here are a few examples:

        John looked at the house.
        = past perfect
        = John pa look at the house.

        John will be reading a book when I arrive.
        = future imperfect
        = John kunpu read a book when I arrive.
        [Keep in mind that "kunpu" can also be pronounced as /kumpu/.]

        John is replacing the front tire.
        = present imperfect
        = John pi replace the front tire.

It is also possible to apply more than one of the more specific aspects at the same time, but the way this is implemented varies considerably from language to language. Some languages have simple and regular rules for doing so, while others must depend on context or periphrasis. English is an example of the latter. Consider the following three English sentences:

        1. Louise started singing the song 5 minutes ago.
        2. Louise started singing the song 5 years ago.
        3. Louise started singing the song 5 years ago and has never
                stopped, even to eat or sleep.

In most circumstances, (1) would be interpreted as perfective-inceptive. Example (2), though, would normally be interpreted as a combination of perfective-inceptive and perfective-habitual (assuming Louise is a human with normal human limitations). However, context makes it clear that (3) can only be interpreted as perfective-inceptive, while also implying that Louise is some kind of supernormal creature.

Now, let's look at some examples:

        He keeps sneezing.
        = present iterative
        = He xwepi sneeze.

        John started singing the song.
        = past inceptive
        = John capa sing the song.

        John used to sing the song.
        = past habitual
        = John jipa sing the song.

Now, compare the last one above with:

        John used to be singing when I visited.
        = past habitual + imperfect verb
        = John jipa kunmaw sing when I visited.

Note that when more than one aspect is applied to a verb using more than one word, tense **must** be applied to the outermost aspect, and the inner aspect(s) **must** be tenseless. A clause may have more than one aspect, but may not have more than one tense. Note that this is consistent with the use of infinitives, participles, and other equivalent non-finite forms in natural languages.

Here are some more examples that require more than one aspect:

        John was starting to sing the song when...
        = past imperfect + inceptive + verb
        = John kunpa camaw sing the song when...

        John used to stop smoking as soon as I arrived.
        = past habitual + terminative + verb
        = John jipa bumaw smoke as soon as I arrived.

        John started to (habitually) smoke when he was 15 years old.
        = past inceptive + habitual + verb
        = John capa jimaw smoke when he was 15 years old.

And so on.

English past perfect and future perfect tenses are used when the tense of the main clause is relative to the tense of an embedded clause. However, there is no need to implement special "perfect" forms in the interlingua, because they can be dealt with using simpler constructions. Here are some examples:

        John will have left when I arrive.
        = John will leave before I arrive.

        John had been sick when Bill arrived.
        = John was sick before Bill arrived.

        John had gone to a great deal of trouble to convince her.
        = John went to a great deal of trouble to convince her.

The English past perfect and future perfect tenses are almost never used in ordinary speech. Instead, simpler constructions like the ones above are used.

The English present perfect form is used when a situation occurred in the past, is still occurring in the present, and will presumably continue into the future. In effect, all three tenses apply. For example, the English sentence "John has been angry for a long time" can be expressed as "John was angry for a long time and continues to be so". Now, we could create a special tense-aspect marker for this, but it's really not necessary. We can simply use the tenseless word "maw". Thus, we have "John maw be-angry for a long time", where "be-angry" is a P-s verb. Note that "maw" is inherently imperfective. \[Note that we can also use the perfective "jaymaw" instead of the imperfective "maw" = "kunmaw", depending on how the event is perceived. However, English does not appear to be able to make this distinction and I'm not sure the distinction is meaningful. (Unless, that is, the actual imperfective translation is "John has been being angry" or "John has been being fixing the car". However, these are not grammatically acceptable).\]

For verbs that use the auxiliary "do" for interrogative present imperfect (eg. "DO you know/have/see/want/etc") rather than "be" (eg. "ARE you eating/staying/going/etc"), the English translation will sound more natural if the adverb "already" is used with the simple present tense:

        John wants a bicycle, but he maw have one
        = *John wants a bicycle, but he has been having one.
        = John wants a bicycle, but he ALREADY HAS one.

        Bill can't hide because I maw see him
        = *Bill can't hide because I have been seeing him.
        = Bill can't hide because I ALREADY SEE him.

But if the verb has a durational case tag, we do not want to use the simple present:

        John wants a bicycle, but he maw have one for three months
        = John wants a bicycle, but he has ALREADY had one for three
            months.

There are also other complex English tense-aspect forms that tend to be used in formal writing but which all have simpler counterparts. For example, "You must have answered all of the questions before you can leave" can be stated more simply as "You must answer all of the questions before you can leave". <span id="S15_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 15.2 Default Tense and Aspect

In the interlingua, we will create a few simple rules that will make the intended tense and aspect obvious - even to a computer - when an explicit tense-aspect marking is missing. Here are the rules that I feel are both natural and efficient:

        If a tense-aspect disjunct immediately precedes the verb, then it
        will set the tense and aspect accordingly.

        Otherwise, if the verb is derived from a temporal deictic root, then
        the tense will be the deictic tense, and the aspect will be
        perfective for past or future or imperfective for present.

        Otherwise, if a verb is modified by a tense-aspect adverb, then the
        adverb will provide the tense and/or aspect.  If the adverb is
        tenseless, then the tense will be past.  If the adverb is
        aspectless, then the aspect will be perfective.

        Otherwise, if the verb follows a conjunction then it will have the
        same tense and aspect as the preceding verb that it is linked to.

        Otherwise, if an embedded clause is introduced by a case tag derived
        from a root that specifies tense (i.e., 'before', 'after', 'when',
        'until', and 'since'), then the default tense of the embedded clause
        will be the same as the tense of the main clause, and the default
        aspect will be perfective.

        Otherwise, the tense and aspect will be past-perfective.

The above tests must be carried out in the order shown.

Here are some examples:

        He break the window.
        = He broke the window.

        He ask me a question.
        = He asked me a question.

        He know geometry.
        = He knew geometry.

        John walk to school.
        = John walked to school.

        He speak to his sister tomorrow.
        = He will speak to his sister tomorrow.

        He speak to his sister three times.
        = He spoke to his sister three times.
        [Since "three times" does not indicate tense (just iterative
        aspect), the default past tense applies.]

        He speak to his sister now.
        = He is speaking to his sister now.
        [The adverb "now" forces the verb to be present imperfective.]

        He will go later and John go too.
        = He will go later and John will go too.

        He arrived after you go.
        = He arrived after you left.

        John will use the computer after you fix it.
        = Unchanged

        Bill will wash the car after you leave.
        = Unchanged.

Note in the last three examples that English uses the non-finite forms "fix", and "leave", even though future tense is implied, but must redundantly use the finite form "left" even though the main clause has past tense. <span id="S15_3"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 15.3 Further Derivation Using Tense-Aspect Roots

The tense-aspect roots represent many useful concepts, and can undergo further derivation to produce many useful words. We can accomplish this by adding appropriate prefixes and suffixes.

Before we can proceed, though, we need to define the semantics of the conversion process. In other words, since we will be using a tense-aspect root as a state root, we need to define the meaning of the resulting state. Here are the meanings that we will use in the interlingua:

> 1\. If a root contains tense information, the corresponding state will represent a point or range of points on the time line. For example, a past tense derivation indicates that the patient occurs before the focus.
>
> 2\. If a root contains aspectual information, the corresponding state will represent a point in time (perfective) or a point within a range of points (all imperfectives). Furthermore, imperfectives may *not* be focused, because the referent is implied by the aspect itself. For example, inceptive indicates the start of the patient event, the terminative indicates a stopping point in the patient event, etc.
>
> \[Technically, this is not correct. However, the results would represent complex states that, to my knowledge, have no single-word counterparts among natural languages. For example, a past-terminative derivation would represent the concept 'P stopping before F', which can be just as easily rendered with two words. Thus, implementing these concepts would require complex programming with little or no known benefit. Because of this, we will not allow imperfective derivations to be focused in the interlingua.\]
>
> 3\. The patient of a derivation is the entity or event that experiences the temporal/aspectual state, while the focus (if any) is the referent. Tenseless derivations cannot have a focus because they do not have a referent. And since imperfectives cannot be focused, they must all be tenseless.
>
> 4\. All tense (but not aspect!) derivations must be static ("-s"). Dynamic ("-d") tense derivations do not make sense because they would imply movement on the timeline in directions other than what occurs naturally.

Tense-aspect terminators will all be P/F-s by default.

With the above in mind, we can now create the following useful words:

        pu (future-perfect):

            puda - P/F-s verb
                    = 'to be in the future relative to the focus'
                            'to occur/happen after', 'to postdate'
                e.g. The accident puda the party.
                    = The accident occurred after the party.

            pude - P/F-s case tag
                    = 'after', 'since', 'subsequent to', 'once'
                e.g. He left pude I did.
                    = He left after I did.

            pusoydo - P-s [-F] adjective
                    = 'subsequent', 'following', 'next', 'succeeding'

                    [The open adjective form "pudu" has the meaning
                    'subsequent to', 'after (a/the)', or 'since (a/the)'.]

            pusoyde - P-s [-F] adverb
                    = 'later', 'afterwards', 'after that', 'since then'
                e.g. We saw him three times since then.

            puva - A/P/F-s verb
                    = 'to cause event P to occur after event F' = 'to
                      have/hold P after F'
                e.g. I puva the meeting Bill arrives =
                     I'm having the meeting after Bill arrives.

            puvya - A/P-s [-F] verb
                    = 'to cause event P to occur later' = 'to
                      have/hold P later'
                e.g. I puvya the meeting =
                     I'm having the meeting later.

        [Note that both "pusyade" and "pusoyde" are synonymous, since
        P-s is semantically equivalent to P-s [-F].  As we mentioned
        earlier, this only applies when the root is focused by default
        (all tense-aspect roots are inherently focused).]

These should look familiar. In the section on [temporal case tags](#S4_3_5), we used the root "pa" to represent the temporal relationship meaning 'before'. This root, as we can now see, is simply the tense-aspect root representing past tense with perfect aspect.

It's important to emphasize that the agent actually causes the event to occur. It's not just being scheduled. For example, we cannot translate "puvya" as 'to schedule P for later'. If we did, it would mean that the following two sentences are synonymous:

        We had the meeting yesterday.
        We scheduled the meeting for yesterday.

Obviously, the two sentences are not synonymous.

Now, let's create some more useful words:

        pa (past, perfect aspect):

            padaw - P/F-s open noun
                    = 'predecessor of', 'precursor of', 'forerunner to',
                            'prelude to'
                e.g. The telegraph was the padaw all modern
                            communications.
                    = The telegraph was the precursor of all modern
                            communications.
            pasoydi - P-s [-F] noun
                    = 'predecessor', 'precursor', 'forerunner', 'vanguard',
                            'prelude'
            [Note that we cannot use "padi" because all of the
                    English glosses imply that the focus is known from
                    context.  We must use the anti-middle "pasoydi".]

            pava - A/P/F-s verb
                    = 'to cause event P to occur before event F' = 'to
                      have/hold P before F'
                e.g. We pava the meeting Bill arrives =
                     We're having the meeting before Bill arrives.

            pavya - A/P-s [-F] verb
                    = 'to cause event P to occur earlier' = 'to
                      have/hold P earlier'
                e.g. We pavya the meeting because of the weather=
                     We're having the meeting earlier because of the
                            weather.

        kunpa (past, imperfect), pi (present, imperfect), and kunpu (future,
            imperfect):

            kunpada - P/F-s = 'to be a range of points that occurs before F'
            pida - P/F-s = 'to be a range of points that occurs at F'
            kunpuda - P/F-s = 'to be a range of points that occurs after F'
            
            These derivations are useless because the fact that P is a range
            of points is indicated by P itself and does not need to be
            repeated in the verb.  Imperfect derivations are only useful
            when range or point F occurs within range P, as we'll see below.

            However, an unfocused present-imperfect derivation can be used
            to indicate that the patient is 'ongoing':

                P-s adjective: pisyado = 'ongoing', 'in progress',
                                    'happening', 'underway'

        See also "nupisyado" below.

        jaypi (present tense, perfect aspect):

            jaypida - P/F-s
                    = 'to be at the time F', 'to occur when/at/while/during
                            the time of/at the same time as'
                e.g. The accident jaypida he fell asleep at the wheel.
                    = The accident occurred when he fell asleep at the
                            wheel.

            jaypide - P/F-s case tag
                    = 'when/at/while/during/for', 'at the time of', 'at the
                            same time as'
                e.g. Louise laughed jaypide Bill arrived
                    = Louise laughed when Bill arrived.
                e.g. I arrived jaypide Bill was eating.
                    = I arrived when/while Bill was eating.
                e.g. I left jaypide the parade = I left during the parade.
                e.g. I worked there jaypide three years.
                    = I worked there for three years.

            jaypiva - A/P/F-s verb
                    = 'to cause event P to occur when/at/while/during F'
                e.g. I jaypiva the meeting the conference
                    = I'm having the meeting during the conference.

            jaypivya - A/P-s [-F] verb
                    = 'to cause event P to occur at the same time'
                e.g. I jaypivya the meeting
                    = I'm having the meeting at the same time.

            jaypika - AP/F-s verb
                    = 'to spend/pass', 'to keep oneself at/during time
                        period F'
                e.g. I jaypika three days here studying French
                    = I'm spending three days here studying French.

            jaypikya - AP-s [-F] verb
                    = 'to spend/pass the time'
                e.g. I jaypikya studying French
                    = I'm spending the time studying French.

In a similar vein, we can use the tenseless root "maw" to create the P-s \[-F\] adverb "mawsoyde" with the meaning 'still', since "maw" implies past, present, and future. In negative and interrogative clauses, the word "yet" can be used instead (e.g. "John is still eating" vs. "John isn't eating yet" or "Is John eating yet?").

It will also be useful to have a past **plus** present root. For this purpose, we will allocate the root-terminator "pay". For example, in its underived form, "pay" represents both past and present (but excludes the future). Thus, the sentence "John pay wash dishes" means 'John washed dishes until just now' or 'John has (just) washed the dishes', and the sentence "It pay snow" means 'It was snowing until just now'. Here are some useful derivations:

        pay (past+present tense, unspecified aspect):

            payda - P/F-s verb
                    = 'to occur both before and at the focal event', 'to
                            last until', 'to take place until', 'to go on
                            until'
                e.g. The party payda midnight.
                    = The party goes on until midnight.

            payde - P/F-s case tag
                    = 'until', 'up to the time of', 'by', 'not later than'
                e.g. We stay here payde it starts raining.
                    = We're staying here until it starts raining.
                     They should arrive payde noon.
                    = They should arrive by noon.

Note that 'past plus present' ("pay") is not the same as negating the future. When we negate the future, we are simply saying that the event did not occur in the future. This means that it could have occurred in the past or the present or neither or both; i.e., there are four possible interpretations. When we combine past and present, we are saying that the event occurred both before and at the referent time; i.e., there is only one possible interpretation.

In the same way, we will allocate the root "pyu" to represent both present and future, but exclude the past. For example, "He pyu work there" means 'He will work there from now on'. Here are some useful derivations:

        pyu (present+future tense, unspecified aspect):

            pyuda - P/F-s verb
                    = 'to occur both at and after the focal event',
                            'to have lasted since', 'to have taken place
                            since', 'to have gone on since'
                e.g. The party pyuda midnight.
                    = The party has gone on since midnight.

            pyude - P/F-s case tag
                    = 'since', 'effective (as of)', 'starting (when)'
                e.g. He is sick pyude October.
                    = He's been sick since October.

            pyusoyde - P-s [-F] adverb
                    = 'since then', 'from then on', 'from that moment on'
                e.g. John use that office pyusoyde.
                    = John used that office from that moment on.

Now, let's do some imperfective derivations. Keep in mind that in all imperfective derivations, the patient is a range of points and the aspect itself indicates the point within the range. Because of this, all imperfective derivations must be tenseless and unfocused.

        camaw (tenseless inceptive):

            camawvya - A/P-s verb
                    = 'to start P', 'to begin P', 'to initiate'
                e.g. We camawvya the new policy in December.
                    = We started the new policy in December.

            camawsyu - P-d verb
                    = 'to start/begin/start up'
                e.g. The rain camawsyu now.
                    = The rain is starting now.

        femaw (tenseless continuative):

            femawvya - A/P-s verb
                    = 'to continue', 'to keep an event ongoing'
                e.g. She femawvya the slow dance while I watched.
                    = She continued the slow dance while I watched.

            femawsya - P-s verb
                    = 'to continue (on)'
                e.g. The rain femawsya until very late.
                    = The rain continued until very late.

            femawsyade - P-s adverb
                    = 'still', 'continue to'
                e.g. John still wants to go to the beach.

        bumaw (tenseless terminative):

            bumawvya - A/P-s verb
                    = 'to stop/halt', 'to bring to a stop/halt'
                e.g. The police bumawvya the illegal gambling at the tavern.
                    = The police halted the illegal gambling at the
                            tavern.

            bumawsyu - P-d verb
                    = 'to stop/halt', 'to come to a stop/halt'
                e.g. The rain bumawsyu now.
                    = The rain is stopping now.

        gimaw (tenseless resumptive):

            gimawvya - A/P-s verb
                    = 'to resume', 'to continue on with'
                e.g. We gimawvya the trip when John was feeling better.
                    = We resumed the trip when John was feeling better.

            gimawsyu - P-d verb
                    = 'to resume'
                e.g. The rain gimawsyu.
                    = The rain resumed.

        jomaw (tenseless completive):

            jomawvya - A/P-s verb
                    = 'to finish', 'to end', 'to bring to an end'
                e.g. We jomawvya the trip when John was feeling better.
                    = We finished the trip when John was feeling better.

            jomawsyu - P-d verb
                    = 'to end', 'to finish', 'to come to an end'
                e.g. The rain jomawsyu at 3 o'clock.
                    = The rain ended at 3 o'clock.

Note that AP-s forms are also useful and imply that the agent affected himself. For example, we must use "bumawkya" in a sentence such as "We'll stop when we reach the next milestone". In other words, "bumawkya" literally means 'to stop oneself'.

        jimaw (tenseless, habitual):

            jimawvya - A/P-s verb
                    = 'to do/perform event P habitually', 'to be in the
                            habit of'

            jimawsyade - P-s adverb
                    = 'usually', 'habitually', 'regularly', 'customarily',
                            'typically', 'routinely'

            jimawsyado - P-s adjective
                    = 'usual', 'habitual', 'regular', 'customary',
                            'typical', 'routine', 'conventional'

            jimawsyadi - P-s noun
                    = 'habit', 'wont', 'custom', 'routine', 'convention'

Tensed habitual derivations will imply habitual events or relationships in the past, the present, or the future:

        jipi (present, habitual):

        The English word "current", as in "current events", is best
            represented by the present-habitual derivation:

        jipisyado - P-s adjective
                    = 'current', 'present', 'present-day/time/age'

        jipa (past, habitual):

        jipasyado - P-s adjective
                    = 'past', 'former', 'earlier', 'prior', 'previous'

        jipu (future, habitual):

        jipusyado - P-s adjective
                    = 'future', 'following', 'later', 'coming', 'next'

        xwemaw (tenseless, iterative):

            xwemawvya - A/P-s verb
                    = 'to do/perform event P iteratively', 'to
                            repeat/iterate', 'to do over and over'

            xwemawsyade - P-s adverb
                    = 'repeatedly', 'iteratively', 'over and over',
                            'time after time'

As we saw earlier, in the chapter on [Counts and Measures](#S9_0), we can also achieve an iterative meaning by using both [specific and non-specific numeric values with the "0" suffix "-koy"](#numeric_adverb). For example, "femukoy" means 'twice', "fomukoy" means 'occasionally/a few times', "bumukoy" means 'never', and so on.

In sum, there is no need to randomly allocate state roots to perform temporal or aspectual functions. In fact, if we should ever discover that we are unable to "derive" an essential temporal or aspectual word using the above approach, then it will imply that our tense-aspect system is incomplete. If this should occur, then an appropriate new entry should be added to the tense-aspect table. <span id="S15_4"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 15.4 Polarity Plus Tense

It's also possible to apply the polarity semi-roots to tense-aspect roots and their derivatives. Here is an example with the future-perfect root "pu":

        bipu       eventually, in a very long time, in the remote future
        xepu       eventually, a long time from now, far in the future
        lapu       in a while, in a moderate time from now
        fopu       soon, in a short time from now, in the near future
        zupu       very soon, in the very near future

Note that "zupu" can be used to capture the meaning of the English expression "to be on the verge of". For example, "Zupu John get a promotion" can be translated 'John is on the verge of getting a promotion'.

Since most languages do not have equivalents to polar tense-aspect disjuncts, the [temporal deictic adverbs](#S10_4) that we discussed earlier will probably be more useful. For example, you can use "xefemay", meaning 'a long time/while ago', instead of "xepa".

It's also possible to use polarity semi-roots with derivations of the tense-aspect disjuncts. For example, "zupude" means 'right after' and "xepada" means 'to occur a long time before'. <span id="S15_5"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 15.5 Deictic Disjuncts

An underived tense-aspect word is very similar to the P-s \[-F\] derivation, which takes an embedded sentence as its only argument. For example, "John pu leave" meaning 'John will leave' is very similar to "Pusoyda John leave" meaning 'At some time in the future relative to an unspecified focus, John will leave', where the unspecified focus is either obvious or provided by the context. However, in simple sentences, where tense is deictic, the unspecified focus is always the time of the utterance. When using an unfocused derivation, the unspecified focus does not necessarily have to be the time of the utterance.

As we discussed [earlier](#S2_7_5), a verb which takes an embedded sentence as its only argument is called a *disjunct*. A disjunct is *deictic* when the unspecified arguments are determined by the speech environment (**who** is speaking, **who** is listening, **where** the speech is taking place, **when** the speech is taking place, etc). When a disjunct is derived by using an unfocused verb or a middle derivation of a focused verb, it is not deictic because the unspecified arguments are obtained from context (i.e., obvious from what has already been said) or from general knowledge. <span id="S16_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 16.0 Modality

Whenever we speak, we always provide some indication of our commitment or attitude towards what we are saying. In effect, we make an impersonal judgment of the truth or consequences of the event we are speaking about. This impersonal judgment of a speaker towards what he is saying is called the *modality* of an utterance, and can vary in kind as well as in degree. Here are some English examples:

        You must go now.            -> 100% obligation
        You should go now.          -> high obligation
        You need to go now.         -> high necessity
        He left.                    -> 100% probability
        He may have left.           -> undefined probability
        He might have left.         -> low probability
        He did not leave.           -> zero probability
        He should be there.         -> high probability
        He's bound to be there.     -> high inevitability
        He'd better be there.       -> high consequentiality
        It seems the storm is over. -> high evidentiality

        [Evidentiality indicates the speaker's judgment about how
        reliable the information is.]

As you can see from the above examples, there is very little regularity in the English modal system, and this is typical of perhaps all natural languages. Modal systems evolve slowly over time and can be quite idiosyncratic. In a single language, some modals may take the form of inflections, some may use auxiliaries, while some may use verbs, adverbs, or other open class words. In this respect English is typical.

Unfortunately, different languages implement modal concepts in different ways, and a particular modal may be used for more than one type of modality or may cover different degrees. For example, the English modal "should" can express either probability or obligation.

There may also be different ways of expressing the same type and degree of modality. For example, the English expressions "should" and "ought to" are essentially synonymous, as are "must/have to", "does it matter/is it important", and so on.

Finally, modalities often overlap in meaning. For example, both "must" and "have to" can imply either obligation, probability, or inevitability.

In fact, the modal systems of natural languages vary *so* much and are *so* idiosyncratic, that a truly neutral and regular system is unlikely to resemble the system of **any** natural language. Fortunately, the semantics of modality is highly regular, and **can** be categorized. <span id="S16_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 16.1 Modal Concepts

The most basic modal concept is 'probability'. It is the most basic because it provides us with the most common sentential types: positive statements, negative statements, and statements of the likelihood of events. Here is a breakdown of the probability modality:

        probability:
            He left yesterday.                      100% probable
            He must have left yesterday.            high
            He probably left.                       average
            He might/could have left yesterday.     low
            He just might have left yesterday.      very low
            He did not leave yesterday.             0%
            He may have left yesterday.             undefined
            Did he leave yesterday?                 interrogative

The 100% probability modality is normally referred to as the *indicative*, the 0% probability modality is referred to as the *negative*. Also, the 100% probability modality is normally unmarked. When it is explicitly marked, it is called the *emphatic*. (Cf. "He left yesterday" vs. "He did leave yesterday" or "He definitely left yesterday".)

There are also several other modalities. However, in most natural languages, these modalities generally only have unique modal forms for the 100% or high degree, if at all. Other degrees of modality are generally obtained by use of adjectives, adverbs, normal verbs, disjuncts, and other kinds of periphrasis. Here is a listing of a few of the other modalities, illustrating the 100% and the high degrees of each one in English:

        obligation:         He must (= has to) go now.      100%
                            He should (= ought to) go now.  high

        necessity:          It is essential that he go now. 100%
                            He needs to go now.             high

        evidentiality:      It's obvious that he left.      100%
                            He seems to have left.          high
                              or It looks like he left.

        inevitability:      He must be there by now.        100%
                            He's bound to be there by now.  high

The other degrees of modality (and occasionally the 100% and high degrees, as well) are often quite idiosyncratic, and may require adjectives, adverbs, normal verbs, and unusual language-specific forms of prosody and/or periphrasis.

Some linguists consider certain feelings about an event to be modal in nature. Here are some examples:

        fear:       I fear that he left.

        sorrow:     It's sad that he flunked the course.

        curiosity:  It's curious that he left so early.

        revulsion:  It's disgusting that he'd be so crude.

However, these are not true modals because the embedded event **causes** the state of the speaker. For a true modal, the speaker is judging a situation and must be the source of the judgment. Besides, these feelings are inherently mental and personal, and represent the state of the speaker himself. They do **not** represent the speaker's impersonal or unbiased judgment of an event. Thus, they should be derived from basic state verbs.

Some people may also be tempted to include other attitudes, such as anger, fondness, hatred, suspicion, desire, optimism, etc. among the modals. However, these again do not indicate the speaker's judgment about what he is saying. In fact, they are true mental states that represent the speaker's feelings towards the event, the listener, or a third party.

In summary, a true modal must be judgmental, but it must also be impersonal, which means that it must not represent the mental or emotional state of the speaker or others he may be speaking for.

Since all modalities express the speaker's judgment towards what he is saying, they are, in effect, a kind of speech act, and it should not be surprising that modalities that do not have formal expression in a particular language are often implemented using speech act verbs (e.g. the English hortative "to urge"). In fact, all true modals can be paraphrased as something like "I say that there is X degree of modality Y that Z". For example, the sentence "You need to find a job" can be paraphrased as "I say that there is a high degree of necessity that you find a job". And like all speech acts, the 'agent' (i.e. the speaker) attempts to cause a change of state in the 'patient' (i.e. the listener), either by affecting the behavior of the patient or by imparting information to the patient. In other words, the speech act either tries to convince the listener to do or to not do something, or it tries to get the listener to accept, question, reject, or supply information. It's important to keep this in mind if you should ever feel that other concepts may be inherently modal in nature. \[Later, we'll discuss a rigorous and comprehensive [test for modal concepts](#S16_5).\] <span id="S16_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 16.2 The Semantics of Modality

All modalities belong to one of two categories:

        1. Epistemic: an impersonal judgment of a REAL situation
            (e.g. "John may have gone away.")

        2. Deontic: an impersonal judgment of a HYPOTHETICAL situation
            (e.g. "John should go away.")

As we saw above with epistemic probability, each modal concept can take on a range of values. Here are complete examples for epistemic probability and deontic obligation:

        Epistemic probability:
            100%:           John left.
            high:           John must have left.
            average:        John probably left.
            low:            John might/could have left.
            very low:       John just might have left.
            0%:             John did not leave.
            undefined:      John may have left.
            interrogative:  Did John leave?

        Deontic obligation:
            100%:           John must/has to leave.
            high:           John should leave.
            average:        John probably should leave.
            low:            John may/might have to leave.
            very low:       John just may/might have to leave.
            0%:             John doesn't have to leave.
            undefined:      John can/may leave.
            interrogative;  Should John leave?

Thus, 100% and high versions of deontic modalities imply that the hypothetical event can, should, or will occur. The low and 0% versions simply indicate lower degrees of commitment on the part of the speaker. The undefined deontic is used to indicate that change is optional.

Obviously, there is a great deal of similarity between modals and scalar states. However, there is also an important difference. For scalar states, the unmarked condition is a normal distribution centered about the 50% point, and **never** includes the 0% point. For example, the word "jinxe", meaning 'hot', has the 50% point (semi-root "la-") at its most prototypical interpretation, but it can also include the high and low degrees, and even the maximum and minimum degrees. However, it can **not** include the 0% degree (semi-root "bu-").

For modals, the unmarked condition (i.e., the "undefined" degree) is a straight line with zero slope which **can** include the 0% degree. For example, if I say "John may be in Boston", it's possible that he *is* in Boston. But it's just as possible that he is **not** in Boston. Thus, the undefined degree *is* compatible with the 0% degree. For deontic modalities, we are dealing with hypothetical situations. Thus, instead of a range of "probability", the undefined modal has a range of "obligation", including 0%. And this, of course, simply indicates that the target of the modality has an option.

Also, do not confuse the 0% and undefined deontic modalities. For example, 0% obligation indicates that there is no obligation, which may or may not imply an option. The undefined modal clearly indicates an option.

There are several other modalities. Here's another epistemic one:

        Epistemic evidentiality:

            100%:           It's obvious/clear/evident that John left.
            high:           John seems to have left.
                            OR It looks like John left.
            average:        There's reason to believe that John left.
            low:            There's little reason to believe that John
                                    left.
            very low:       There's almost no/hardly any reason to believe
                                    that John left.
            0%:             There's no reason to believe that John left.
                            John couldn't possibly have left.
            undefined:      There may or may not be reason to believe that
                                    John left.
                            John could have left (but I'm not sure).
                            It's unclear/uncertain that John left.
            interrogative:  What reason is there to believe that John left?

Thus, evidentiality indicates what **appears** to be true - not what actually *is* true. In effect, it simply comments on how reliable the speaker feels the information is. A good English paraphrase for evidentiality is "As for event X, the evidence is 100%/high/low/etc". Thus, evidentiality does not state that something actually happened or did not happen. It simply states how 'evident' the event is.

Some languages provide even greater detail, such as whether the speaker saw the event with his own eyes or heard it with his own ears. However, these more specific modalities are relatively rare. Also, the **means** by which information is obtained is basically periphrastic - it is **not** inherently modal and, technically, should not be part of a system of modality.

Here's another example of an epistemic modality:

        Epistemic inevitability:

            100%:           He can't help being there by now.
                            or  He must be there by now.
                            (The implication is that the event is totally
                                    predictable.)
            high:           He's bound to be there by now.
                            (The implication is that the event is expected;
                                    i.e., very predictable.)
            low:            It wouldn't surprise me if he's there by now
                                    (but I don't really expect it).
            0%:             I don't EXPECT him to be there by now (but he
                                    may be for all I know).
            undefined:      He could be there by now, but who knows?
                            (The speaker is not sure how predictable the
                            event is.)

Here are brief examples of a few other modalities:

        Epistemic acceptability:

            What he's doing is acceptable/okay. (average)
            At least he remembered to bring the hot dogs. (minimal)

        Deontic necessity:

            He needs to take care of them. (high)

        Epistemic significance:

            It's very significant that he left early. (high)
            Does it matter that John won?  Yes, it matters. (interrogative)

        Deontic consequentiality:

            It's critical that he keep his commitment (100%)
            He'd better keep his commitment. (high)
            It's important for him to keep his commitment. (average)

            [This modality implies that a situation will have negative
            consequences if the hypothetical event does not take place.]

[Later](#S15_5), we'll discuss other potential modalities. We'll also discuss how to test new concepts to determine if they are inherently modal in nature. <span id="S16_3"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 16.3 Implementing Modality

So, how should we implement modality in a way that captures its inherent regularity, while avoiding the ubiquitous variability and idiosyncracy of natural languages?

There are three characteristics of modality that we need to represent:

        1. The modal concept (e.g. probability, evidentiality, etc.)

        2. The degree of modality (e.g. 100%, high, negative, etc.)

        3. The type of modality (i.e. epistemic or deontic)

However, there is no need to explicitly mark whether the type of a modal is epistemic or deontic, because the type is an inherent part of the modal concept.

\[Incidentally, if there were some way to derive one type from the other, then we **would** want to explicitly mark the type. For example, what is the deontic counterpart of epistemic acceptability? What is the epistemic counterpart of deontic obligation? Although I did once think that there was a correlation, I was never able to state the correlation with semantic precision, and so I abandoned the idea.\]

So, in order to implement modality in the interlingua, we will allocate a set of root morphemes to represent the modal concepts. The polarity semi-roots can then be used to indicate the degrees of modality. If a modal root is **not** modified by a polarity semi-root, it will represent the undefined degree.

Here are the details:

            Modality               Morpheme
        --------------------------    ----------
        Probability (epistemic)         me
        Evidentiality (epistemic)       lime
        Inevitability (epistemic)       tonme
        Acceptability (epistemic)       geme
        Significance (epistemic)        fawme

        Obligation (deontic)            mo
        Necessity (deontic)             byomo
        Consequentiality (deontic)      jomo

And here again are the degree morphemes that we will use:

        bu-     0%
        bi-     100%
        xe-     High
        la-     Average
        fo-     Low
        zu-     Very low
        -ki     Interrogative (suffix)

We are introducing the 'interrogative' suffix "-ki" for the first time. It will convert a modal to the interrogative degree.

If a degree morpheme is **not** used, the degree of the modality will be "undefined".

Technically, use of "-ki" with a modal does not indicate the speaker's attitude about the event. Instead, the speaker is asking the listener what the listener's attitude is, or what the speaker's attitude should be. In other words, the speaker is asking the listener to provide the correct degree of modality.

Finally, since a modal is inherently deictic and takes an entire clause as an argument, they will be deictic disjuncts by default, just as we did for tense-aspect words.

Now, in all natural languages that I am familiar with, the indicative is the default and is unmarked. Thus, it might seem that the 100% epistemic probability marker "bime" is not really needed. However, a language must have a way of emphasizing the truth of a statement, and "bime" is the obvious and natural choice for this function. (Cf. "He went to the house" vs. "He DID go to the house", or "He definitely went to the house", or "He went to the house for sure".)

Here are some examples using English word order:

        Louise bime buy it
        = Louise DID buy it.

        Louise bume buy it
        = Louise didn't buy it.

        Meki Louise buy it
        = How likely is it that Louise bought it?

        Louise xeme buy it
        = Louise must have bought it
           OR Louise almost certainly bought it.

        Louise lame buy it
        = Louise probably bought it.

        Louise me buy it
        = Louise may have bought it.

        Louise zume buy it
        = Louise just might have bought it.

        She bimo leave now
        = She has to leave now.

        She bumo leave now
        = She does not have to leave now.
          (Literally, 'There is no obligation for her to leave now'.

        She mo leave now
        = She may/can leave now.
          (Literally, 'She has the option of leaving now'.)

        She bume mo leave now
        = She may not/can not leave now.
          (Literally, 'She does not have the option of leaving now'.
                Note the distinction between this and "bumo".)

        She xemo leave now
        = She should leave now.

        He xebyomo study harder
        = He needs to study harder.

        He xetonme cause trouble
        = He's bound to cause trouble.

        He xelime leave
        = It looks like he left.  OR  He seems to have left.

        He xejomo leave now
        = He'd better leave now.

In the chapter on [Tense and Aspect](#S15_0), we defined a [default tense](#S15_2) that would apply to verbs when it was not specified. It is also possible for a modal to have tense. It is even possible for the modal and the verb to have different tenses. Here are some examples:

        John seems to have been angry.
            (modal = present, verb = past)

        It will seem that John was angry.
            (modal = future, verb = past)

        It seemed that John will be angry (but it doesn't seem
         that way any more).
            (modal = past, verb = future)

Some English modals cannot carry tense at all, and if tense is needed, then it must be done using a paraphrase of the modality. Here are some examples:

        (1) John may be in Boston.
        (2) It is possible that John is in Boston.
        (3) It will be possible that John will be in Boston.
        (4) It was possible that John will be in Boston
            (but it's not possible any longer).

Note that (1) can be interpreted as either present or future. To make it explicit, paraphrases (2) or (3) can be used. Example (4) shows that the modality can have past tense while the verb has future tense.

So, since it's possible for the modality to have tense that is different than the verb, the modality must also have a default tense and aspect. In the interlingua, all epistemic modal deictic disjuncts will be present imperfect by default. In other words, the possibility exists, by default, at the time of speech.

For example, the default tense for the verb "to leave" is past. Thus, "John leave" is 'John left'. However, the sentence "John me leave" means 'John may have left' (literally: 'it **is** possible that John left'). In other words, the default tense-aspect of the modal is **not** inherited by the verb - the tense-aspect of the modal and the verb are determined independently.

All deontic modal disjuncts will have the same tense as the verb that follows. In other words, the obligation exists at the same time as the event.

For example, "John bimo leave" means 'John had to leave', since "leave" is past-perfect by default. Similarly "John moki leave" will mean "Should John have left?". To indicate that the obligation existed in the present or future, an explicit tense marker can be used. Thus, "John pi bimo leave" means 'John has to have left'.

Now, consider the following:

        Should John leave now?
        Does John have to leave now?

We can use "moki" for the first example, because it is effectively asking 'how obligatory is it for John to leave?', which is a good paraphrase as long as "should" is not stressed. However, in the second example, or if "should" is stressed in the first example, we are really asking if it is **true** that a **particular** degree of obligation applies. A possible English scenario could be this:

        A: Does John HAVE to leave?
        B: No. He doesn't HAVE to leave but he SHOULD leave.

In other words, what we need is a general purpose interrogative marker. This, of course, is simply "meki", since we are asking for the degree of probability that the statement "John has to leave" is true. In effect, we are asking "What is the probability that John has to leave?", and we are expecting an answer such as "yes", "no", "maybe", or whatever degree of probability is appropriate.

With this word, we can now deal with the above examples:

        Should John leave now?
        = moki John leave now?

        SHOULD John leave now?
        = meki xemo John leave now?

        Does John have to leave now?
        = meki bimo John leave now?

Thus, in effect, "meki" can also be paraphrased as "Is it true that ... ?".

When "meki" introduces an embedded clause, it will indicate that the speaker wants to know if the clause is true, and will be equivalent to English non-conditional "if/whether", as in the following examples:

        I asked Bill meki you have enough money.
          = I asked Bill if you have enough money.
        I want to know meki Bill needs my help.
          = I want to know if Bill needs my help.

Note that this is **not** the same as quoting the embedded clause. For example, there is a difference between "I asked Bill if you have enough money" and "I asked Bill 'Do you have enough money?'". We'll discuss [quoting](#S21_5) later.

Also, do not confuse this usage of "if" with the conditional conjunction "if" (which we will discuss [later](#S21_6)). Even though English uses the same word for both purposes, their semantics are quite different.

A clause can contain no more than one deontic modal disjunct, and it must follow any epistemic modals. For example:

        Meki bume bimo John leave = Doesn't John have to leave?

An epistemic modal may never follow a deontic modal because, if it were done, the epistemic modal would not actually be a true modality. Consider this:

        It has to be possible to open the window.

In the above sentence, the verbal phrase "be possible" is not a modal disjunct - it's actually a state verb. However, as we'll see below, this state verb will be derived from the epistemic modal root "me". <span id="S16_4"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 16.4 Further Derivation Using Modal Roots

As was the case with tense-aspect roots, modal roots can be used to derive many additional words. Before we can start, though, we need to define the equivalent 'state' of a modal. In other words, what is the basic or raw state that is associated with a modal?

As I mentioned above, all of the modal derivations are similar to speech acts, since the speaker tries to induce a change of state in the listener using speech. However, unlike a true speech act, a modal **always** describes the speaker's impersonal judgment of a situation that may be completely unrelated to the speech act itself. In other words, a modal is a combination of a speech act, an additional situation, plus the speaker's judgment of the additional situation. Thus, a modal concept is much more complex than most basic states, and this overly complex concept will not be useful if it undergoes further derivation.

Fortunately, the most useful component of a modality is how the speaker judges the situation. If we can isolate this attitude, it will provide us with a simpler concept that we can then use very productively in further derivations.

Thus, we need a strategy that will eliminate the speaker's contribution such that only the basic modality remains. To that end, we will paraphrase the modal in such a way that it eliminates the 'speech act' component and isolates the modal concept. We will do this by using each modal in a test sentence and paraphrasing it in the form "it is X that Y", where X is the modal concept, and Y is the subject matter. Here are several examples:

        Epistemic probability:

            100%:           He took care of the children.
                            It is true/definite that he took care of them.

            high:           He must have taken care of them.
                            It is highly probable/likely that he took care
                                    of them.

            average:        He probably took care of them.
                            It is probable/likely that he took care of them.

            low:            He just may have taken care of them.
                            It is unlikely/improbable that he took care of
                                    them.

            very low:       He almost certainly did not take care of them.
                            It's implausible/hardly possible that he took
                                    care of them.

            0%              He did not take care of them.
                            It is false/impossible that he took care of
                                    them.

            undefined:      He may have taken care of them.
                            It is possible that he took care of them.

        Deontic obligation:

            100%:           He must take care of them.
                            It is mandatory/obligatory that he take care of
                                    them.

            high:           He should take care of them.
                            It is advisable that he take care of them.

            undefined:      He can/may take care of them.
                            It is optional that he take care of them.

        Epistemic evidentiality:

            100%:           It's obvious/evident that he took care of them.

            high:           It seems/appears that he took care of them.
                            It is apparent/almost obvious that he took
                                    care of them.

        Epistemic inevitability:

            100%:           He can't help taking care of them.
                            It is inevitable/fated/preordained that he took
                                    care of them.

            High:           He's bound to take care of them.
                            It is almost inevitable that he took care of
                                    them.

        Epistemic acceptability:

            100%:           It's definitely acceptable/okay that he took
                                    care of them.

            high:           It's very acceptable/welcome/gratifying that he
                                    took care of them.

            average:        It's acceptable/okay that he took care of them.

            very low:       It's tolerable/barely acceptable that he took
                                    care of them.
                            At least he took care of them.

            undefined:      It's possibly acceptable/okay that he took care
                                    of them.

            0%:             It's unacceptable/not okay that he took care of
                                    them.

        Deontic necessity:

            100%:           It's essential that he take care of them.

            high:           He needs to take care of them.
                            It is necessary that he take care of them.

            0%:             It's unnecessary that he take care of them.

        Epistemic significance:

            100%:           It is crucial/extremely significant that
                                    he left early.

            high:           It matters that he left early.
                            It is significant that he left early.

        Deontic consequentiality:

            100%:           It is crucial/pivotal/critical/extremely
                                    important that he leave early.

            high:           He'd better leave early.
                            It is very important that he leave early.

            average:        It is important that he leave early.

Note that none of the above are true states. If they were, they would describe the states of **entities**. Instead, they describe the impersonal judgment of the speaker about a **situation**. Thus, the situation is actually the focus of the speaker's mental state. For example, if a situation is 'obvious', then the speaker **feels** that it is obvious. If a situation is 'acceptable' then the speaker **feels** that it is acceptable. And so on. In other words, the true states can be best captured in the form of P/F-s verbs, since they indicate a relationship between a patient/entity and a focus/situation. The raw concepts themselves (i.e. 'true', 'obvious', 'acceptable', etc.) can be represented by the F-s \[-P\] middle voice forms.

Note also that all of the epistemic paraphrases use the past tense, while all of the deontic paraphrases use an implicit future tense. I discovered that using this convention is less likely to result in confusion (at least when the paraphrases are in English). It is also consistent with the inherent natures of epistemic and deontic concepts; i.e., epistemic judgments are concerned with actual events, while deontic judgments are concerned with hypothetical (i.e., future) events.

Now, in order to convert the modal concept to a state, we must add a patient. The best way to do this is to paraphrase the P/F-s state verb using an expression such as "Patient feels/thinks that focus". Here are some epistemic examples:

        probability:        I feel that situation F is true
                            = I believe F
                            I feel that situation F is unlikely/improbable
                            = I doubt F

        evidentiality:      I feel that situation F is obvious
                            = I am confident/sure/certain that F

                            [The above implies that the speaker has good
                            reason to believe F; i.e., that the certainty is
                            based on evidence or reason.]

        inevitability:      I feel that situation F is inevitable
                            = I take F for granted
                            I feel that situation F is almost inevitable
                            = I expect F

        acceptability:      I feel that situation F is acceptable
                            = I am at ease/comfortable/content with/that F

        significance:       I feel that situation F is significant/matters
                            = I am convinced of the significance of/that F

Note that each modal concept has now become an actual mental state of a patient.

Now, let's see if we can do the same thing with a few deontic modalities:

        obligation:         I feel that event F is mandatory = I ???
        necessity:          I feel that event F is necessary = I ???
        consequentiality:   I feel that event F is important = I ???

What's wrong? It seems that deontic modalities do not really describe the state of the speaker. Instead, the speaker is actually describing the state of someone or something else. Thus, it's necessary to paraphrase deontic derivations in terms of the other entity, as follows:

        obligation:         Something is mandatory for the patient
                            = The patient is obligated to...

        necessity:          Something is necessary for the patient
                            = The patient needs/has a need to/for...

        consequentiality:   Something is important for the patient
                            = The patient is liable/answerable/
                                    accountable/responsible for...

                            [I am using the word "important" here
                            only in the sense that there may be
                            negative consequences for the patient if
                            the indicated event does not take
                            place.]

Thus, for epistemic modalities, we must paraphrase the state as the equivalent state of the speaker. For deontic modalities, we must paraphrase the state as the equivalent state of the entity that the speaker is talking about.

Also, the epistemic states are true mental states of the patient, while the deontic states are still abstract. This should not be surprising since epistemic modalities apply to real situations, while deontic modalities apply to hypothetical ones.

Finally, since the epistemic mental states are inherently under the control of the speaker ('believe', 'doubt', 'be confident', 'expect', etc), they will be AP/F-s by default when their part-of-speech is changed from disjunct to something else. However, since deontic states reflect an outsiders view of the modal state of a patient ('need', 'be obligated to', 'be liable for', etc), they will be P/F-s by default.

Now, with all of the above in mind, let's create several useful words from modal roots. Here are some of the many possible derivations from the epistemic probability modality:

        100% epistemic probability, "bime":

            AP/F-s  bimeda = to believe, to take as true that,
                        to be convinced that
                bimesodi = accepted fact, the truth, that which is believed
                        true ("-so" = middle suffix)
                bimesodo = true/veritable
                bimesode = really, truly, definitely, absolutely,
                                positively, indeed

            ["Bimesode" is more general than "bime", since it can imply
            that others in addition to the speaker are certain of the truth
            of the statement.  Also note that, since it is an adverb, its
            syntax is different as well.]

                bimevodi = belief, tenet, article of faith,
                        something taken to be true ("-vo" =
                        passive suffix)
                nebimedi = faith, conviction
                        ("ne-" = quality prefix)
                nebimesodi = truth, veracity, truthfulness
                Bimeso = Yes, That's true/correct/right, etc.
                    [Literally, 'the speaker agrees that something just said
                    is true'.  Note that "Bimeso" is still a deictic
                    disjunct, and that the middle voice change indicates
                    that its single sentential argument is assumed to be
                    the declarative version of what was just said.]

            English speakers should be careful not to extend the meaning of
            these derivations to people.  For example, in the sentence "You
            are correct", the speaker really means 'What you are saying is
            correct'.  Thus, it's acceptable to say "THE ANSWER is correct",
            but not "YOU are correct". In other words, 'truth' or
            'correctness' applies to a situation - not to a
            person.

            AP/F-d  bimeku = to decide, to make up one's mind, to convince
                             oneself, resolve
            A/P/F-d bimevu = to persuade, to convince, to win over
            P/F-s   bimesa = to realize, to be aware that, to understand,
                             it is P's understanding that F
                             (e.g. "It's my understanding that Joe won't
                                    be here tomorrow".)
            P/F-s   bimesado or bimesadu = credulous (about)

        High epistemic probability, "xeme":

            AP/F-s  xemeda = to think/feel/reckon, to take as
                                likely/probable, to be of the opinion
                xemesodo = likely/probable, almost certain
                Xemeso = Probably, Almost certainly, In all likelihood,
                        That's almost certainly right, etc.
                        (e.g. in answer to a question)
            AP/F-d  xemeku = to surmise/conjecture/speculate,
                                    to decide that F is likely
            [English "surmise", "conjecture", and "speculate" often
                    imply that a conclusion is reached with little evidence.
            "Xemeku" does not have this implication.]

            P/F-s xemesa = to suppose/presume/gather/daresay, to accept as
                                likely

        Low epistemic probability, "fome":

            AP/F-s  fomeda = to doubt, to be doubtful about, to have
                        doubts about, to question, to be skeptical
                        about, to consider unlikely/improbable, to
                        take as unlikely/improbable
                fomedo = skeptical/doubting/doubtful (i.e. a person)
                fomesodo = dubious, unlikely, improbable, hard to
                        believe (i.e. an event or situation)
                fomesodi = a dubious/unlikely/improbable event or
                                situation
                nefomedi = doubt, skepticism
                Fomeso = Probably not, Not likely (e.g. in answer
                        to a question)

        0% epistemic probability, "bume":

            AP/F-s  bumeda = to disbelieve, to take as false
                bumedo = unbelieving, disbelieving, incredulous
                bumedi = unbeliever, non-believer
                bumesodo = false/untrue/incorrect/wrong/impossible
                Bumeso = No, That's wrong/incorrect, It's not true
                        (e.g. in answer to a question)

        Undefined epistemic probability, unmodified "me":

            AP/F-s  meda = to accept as possible, to admit the possibility
                                    of
                mesodo = possible
                mesode = possibly (adverb)
                nemesodi = possibility, likelihood, probability, potential
                Meso = Maybe/Perhaps (e.g. in answer to a question)

Someone once said that all truth is relative. The above derivations certainly seem to reflect this attitude, since they imply that the truth of a situation is more perceived than real; i.e. it is true only if it is true to a patient. However, keep in mind that when the patient is demoted by means of a **middle** voice operation, the result implies nothing about the nature of the unmentionable perceiver. It could just as well be the universe, your cat, or a supreme being. In spite of this, it is important to remember that 'truth' as derived above does **not** mean 'absolute truth' or 'reality'. Thus, we cannot use the modal to derive concepts such as 'to exist = to be real' or 'to create = to make real'. The modals do not imply reality - only the perception of reality. Another difference is that the 'truth' described here is inherently scalar, while the concept we derived earlier meaning 'real/actual' (state root = ["fi"](#fi)) is inherently binary.

Although I listed a large number of useful derivations for the epistemic probability modality, there are many more. The modal concepts are so basic, that it shouldn't be surprising that they can be the source of so many useful words. However, for the sake of brevity, I will only list a few derivations for the remaining modalities:

        100% deontic obligation (= obligation), "bimo":

            P/F-s bimoda = it is mandatory/compulsory/obligatory
                                for P to F, to be obligated to
                bimokweda = to be mandatory/compulsory/obligatory for
                bimosodo = mandatory, compulsory, obligatory
                bimosodi = duty, obligation
            AP/F-s  bimoka = to feel obligated to...
            AP/F-d  bimoku = to take on the obligation to...
            A/P/F-s bimova = to require, to oblige

        High deontic obligation, "xemo":

            P/F-s xemoda = it is advisable/desirable for P to F,
                                it behooves P to F, it's a good idea for P
                                to F
                xemosodo = advisable, desirable, called for

        Average deontic obligation, "lamo":

            P/F-s lamoda = to be supposed to (e.g. John is supposed to
                                            bring the coffee.)

        Undefined deontic obligation, unmodified "mo":

            P/F-s moda = it is optional for P to F, P has the freedom/
                    choice/option to
                modo = having a choice, free to choose
                mokweda = F is optional for P
                mosodo = optional
                mosodi = option

            [The inverse form "mokweda" would be used for English
            sentences such as "Picking up the litter is optional
            for the guests".]

            A/P/F-s mova = to let, to allow, to permit (literally: to cause
                    someone to have the option to...)

        100% epistemic acceptability, "bigeme":

            AP/F-s bigemeda = to feel that F is maximally acceptable, to
                    feel that F is perfect or ideal, to totally approve of

        Average epistemic acceptability, "lageme":

            AP/F-s lagemeda = to be at ease/comfortable/content that/with, to
                        feel that F is acceptable, to approve of, to accept,
                        to countenance, to sanction
                lagemedo = content, at ease, comfortable,
                lagemesodo = acceptable, okay, admissible

        low epistemic acceptability, "fogeme":

            AP/F-s fogemeda = to feel that F is not very acceptable, to
                                    disfavor, to frown upon, to deprecate

        0% epistemic acceptability, "bugeme":

            AP/F-s bugemeda = to feel that F is unacceptable/inadmissible/not
                                    okay, to disapprove of, to oppose
                bugemedo = disapproving, opposed, hostile
                bugemesodo = unacceptable, inadmissible, intolerable
                bugemevaydi = disapproval, opposition

        100% deontic necessity, "bibyomo":

            P/F-s bibyomodo = destitute, in extreme need
                bibyomosodo = essential, indispensable, vital, exigent

        High deontic necessity, "xebyomo":

            P/F-s xebyomoda = to need, to require, to have a need for
                        (note that this is a VERB, not a disjunct!)
                xebyomodo = needy, in need
                xebyomosodo = necessary, needed, requisite, required
                xebyomosodi = need, requirement (i.e. what is needed)
                nexebyomodi = necessity, need, requirement (the need
                        itself)

                [Keep in mind that some of the English "ne-" equivalents are
                ambiguous.  For example, "nexebyomodi" literally means 'high
                degree of necessity' while "nebyomodi" means 'degree of
                necessity' with no indication of the actual degree (it could
                even be zero).  Thus, it doesn't make sense to ask "What is
                the nexebyomodi?", but it does make sense to ask "What is
                the nebyomodi?".  On the other hand, it doesn't make sense
                to say "The nebyomodi for more money is obvious".  Instead,
                "nexebyomodi" must be used.]

        0% deontic necessity, "bubyomo":

            F-s [-P] bubyomosodo = unnecessary, unessential, inessential
            A/F-d [-P] bubyomovusoy = to make unnecessary, to obviate

The following derivations of epistemic evidentiality are very similar to the derivations for epistemic probability, and the English glosses are often the same. However, it's important to keep in mind that evidentiality implies the presence or absence of evidence, whereas probability has no such implication. Thus, the probability derivations are more general than the evidentiality derivations. For example, both the derivations "bimevu" and "bilimevu" can be glossed as "to convince", but "bilimevu" implies that evidence (reason, logic, data, etc) was used to convince the patient, while "bimevu" says nothing at all about how the patient became convinced.

        100% epistemic evidentiality, "bilime":

            AP/F-s bilimeda = to be confident/certain/sure (that),
                                to be convinced that,
                                to take for granted that,
                                to know for a fact (that),
                                to know as a matter of fact that
                bilimedo = certain, sure, confident
                bilimesoda = to be evident, obvious, etc that ...
                bilimesodo = evident, obvious, manifest, patent,
                                clear, overt, certain, sure
                nebilimedi = certainty, confidence, certitude
            P/F-s bilimesa = it is evident/obvious to P that F,
            F/P-s bilimesakwe = to be clear/obvious to
                    (E.g. "His anger was obvious to everyone".)
            AP/F-d bilimeku = to conclude (that), to come to the conclusion
                                (that), to come to be certain/confident/sure
                                (that)
                bilimekusodi = conclusion
                bilimekusodo = conclusive
            A/P/F-d bilimevu = to convince, to show, to persuade

        High epistemic evidentiality, "xelime":

            AP/F-s xelimeda = to suppose, to gather, to surmise, to guess,
                                to figure, to reckon, it is apparent/
                                almost obvious to AP that F
                xelimesodo = seeming, apparent, ostensible
                xelimesoda = "It is apparent that..."
                xelimesode = supposedly, apparently

        Average epistemic evidentiality, "lalime"

            AP/F-s lalimeda = to suspect, to feel that there is reasonable
                                    evidence for, imagine

        Low epistemic evidentiality, "folime"

            AP/F-s folimeda = to doubt, to question, to be skeptical
                        about, to consider unlikely or improbable
                        (due to the paucity of evidence or reason)
                folimedo = skeptical
                folimesodo = dubious, problematic

        Undefined epistemic evidentiality, unmodified "lime"

            AP/F-s limeda = to accept as possible because there may be
                                    evidence in support
                limesodo = plausible, conceivable, reasonable, justifiable

        100% epistemic inevitability, "bitonme":

            AP/F-s bitonmeda = to take for granted, to assume/presume, to
                                    feel that F is inevitable
                bitonmeso = to be inevitable
                bitonmesodo = inevitable, unavoidable, pre-ordained,
                                ineluctable
                bitonmesodi = destiny, fate, fortune, lot
                bitonmesosni = inevitability

        High epistemic inevitability, "xetonme":

            AP/F-s xetonmeda = to expect, to anticipate, to feel that
                                F is almost inevitable

        100% deontic consequentiality, "bijomo":

            P/F-s bijomoda = it is imperative for P to F
                bijomosodo = imperative, critical, crucial, vital

        High deontic consequentiality, "xejomo":

            P/F-s xejomoda = it is urgent for P to F
                xejomosodo = urgent, exigent, compelling, pressing,
                                    important, highly consequential

Finally, when an unmodified modal is used (i.e., a deictic disjunct), it is very similar to the non-deictic F-s \[-AP\] middle derivation. For example, "John bime leave" meaning 'John DID leave' is similar to "Bimesoda John leave" meaning 'It is accepted as true by some unspecified agent-patient that John left'. However, there is an important difference between the two. When the deictic disjunct is used, the agent-patient **must** be the speaker. When the middle verb form is used, the patient is unspecified and does not necessarily have to be the speaker. In other words, the argument structure of the deictic modality is actually F-s, since the agent-patient is deictic.

Thus, the deictic disjunct forms of modals are completely compatible with the equivalent derivations using register and tense-aspect morphemes. <span id="S16_5"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 16.5 Are There Other Modalities?

Since modalities represent a speaker's judgment about a situation, and since it's possible for people to pass judgment in many different ways, the obvious question is whether we can implement other concepts as modalities, rather than as basic states.

I am convinced that the answer is a resounding "YES", even though I've only discussed those modalities that I've read about or which seemed obvious to me. There is no doubt in my mind that other modalities exist, and that these modalities are likely to have formal representation (as inflections, auxiliaries, particles, etc.) within some natural languages.

When trying to decide whether a concept is inherently modal in nature, we must keep in mind that a modality represents the speaker's **impersonal** judgment of a **situation**. The concept must **not** represent the speaker's feelings towards the listener or a third party, nor can it represent an attitude that is **caused** by a situation, the listener, or a third party; i.e. the speaker must be the source of the judgment. Also, the concept must not represent the state or behavior of an actual entity or process - it must represent a judgment of a **situation**. Upon further derivation, of course, the concept may represent the mental state of an actual entity (e.g. "to believe" from the modal concept 'true').

Modal concepts are inherently abstract. Normal states are not. Consider the following:

        yellow  vs.  optional
        open    vs.  true
        heavy   vs.  necessary
        good    vs.  important

In effect, a modality is not an **inherent** quality of a situation. Instead, it is externally imposed.

Fortunately, it is definitely possible to test a concept to determine if it is modal in nature. In English, we can test a concept M for modality by using one of the following two sentences:

        (1) It's E that he left early.
        (2) It's D that he leave early.

If (1) makes sense and is grammatically correct, then E may be an epistemic modality. If only (2) makes sense and is grammatically correct, then D may be a deontic modality.

Do **not** use descriptions of mental states or measurable, objective attributes that describe the actual nature of events. For example "sad", "shocking", "odd", "legal", and "ironic" all pass the above test even though "sad" and "shocking" describe mental states (classifier = "-ca"), while "ironic", "legal", and "odd" describe objective, measurable attributes of events (classifier = "-ban").

Also, do **not** use passive forms of verbs for any of the above tests. For example, "known" and "said" pass the above test even though they are obviously not modalities.

Finally, we must also make sure that the concepts are potentially impersonal. They must **not** inherently represent the bias of the speaker! To test this, we can perform the following test:

        (4) I approve/disapprove of what occurred.      <- epistemic
            I hope that the event will/will not occur.  <- deontic

If either of the above statements is automatically implied when the concept is used, then it is **not** a modal concept. If this is not clear, consider the following two sentences:

        (A) It's good that Mike won the game.
        (B) It's a good thing that Mike won the game.

In (A), the speaker is clearly glad about what happened. In (B), however, the approval, if any, is clearly secondary to the implied warning that something bad would have happened if Mike had not won. In fact, in (B), it's quite possible that the speaker does not approve of the event at all, but is merely commenting on its consequentiality. Thus, (A) represents a normal state while (B) represents a modal one.

There may be cases when the dividing line between personal and impersonal is not clear. When this occurs, we will treat the concept as an attribute (classifier = "-ban") rather than as a modal. An example of this is the concept 'fair/just'.

Now, here's a list of other modal concepts that I believe are inherently modal in nature. Each of them passes the above tests:

        I say/believe that something is:

            reasonable/sensible
        others???

In any case, it seems to me that the above concepts (and certainly others I've missed) are indeed modal in nature and should be treated as such. <span id="S16_6"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 16.6 Hedges

There are times when we need to modify the modality of an utterance, implying that the situation is true in spite of reasons to believe otherwise. Linguists refer to this process as "hedging". Here are some English examples:

        a. STRICTLY SPEAKING, his answer was correct.
        b. LOOSELY SPEAKING, a dolphin is a fish.
        c. TECHNICALLY, a penguin is a bird.
        d. Bill joined the SO-CALLED Society for Universal Tolerance.

In each case, the capitalized expression either affirms or denies the truth of a sentence or the accuracy of a label while implying that there is reason to think otherwise. Thus, example (a) can be paraphrased as "His answer was correct even though there are reasons to feel that it was really incorrect". Example (b) indicates that a dolphin is **not** a fish, even though there are reasons to think otherwise. Example (c) is similar to (a) but implies that there is actual data or proof to support the claim. And example (d) implies that there may be reasons to believe that the name of the society is invalid.

In the interlingua, we will implement hedging with the epistemic modal root "xwame". Here are English paraphrases of the available forms:

        xwame    It is true that ... even though there MAY be
                        reason to think otherwise.

        bixwame  It is true that ... even though there is
                        every reason to think otherwise.

        xexwame  It is true that ... even though there is good
                        reason to think otherwise.

        laxwame  It is true that ... even though there is
                        reason to think otherwise.

        foxwame  It is true that ... even though there is a
                        small amount of evidence to think otherwise.

        zuxwame  It is true that ... even though there is a
                        tiny amount of evidence to think otherwise.

        buxwame  It is NOT true that ... even though there may be
                        reason to think otherwise.

        xwameki  It is true that ..., but what reason is there to
                        think so?

Here are some examples:

        Xexwame a dolphin is a mammal.
        = Even though there is much reason to think otherwise,
                a dolphin is a mammal.
        = Strictly speaking, a dolphin is a mammal.

        Buxwame a dolphin is a fish.
        = A dolphin is not a fish, even though there may be reason to
                think otherwise.
        = Loosely speaking, a dolphin is a fish.
          OR In a sense, a dolphin is a fish.
          OR In a manner of speaking, a dolphin is a fish.
          OR In some/certain respects, a dolphin is a fish.
          OR Actually, a dolphin is NOT a fish.

        Bill joined the buxwamesodo "Society for Universal Tolerance".
        = Bill joined the so-called/self-styled "Society for
                Universal Tolerance".
        [Here we are saying that the society has nothing to do
        do with universal tolerance, even though the name may imply it.]

At first glance, hedging appears to be the direct opposite of evidentiality, since hedging is used to indicate that there is evidence **against** something. However, there is an important difference: evidentiality does not imply the truth of a situation - it simply indicates the degree of evidence in its favor. Hedging, however, **does** imply the truth of a situation, while at the same time indicating the degree of evidence against it. If we need to indicate the true opposite of evidentiality, we simply negate the embedded clause. Consider the following:

        High evidentiality:
            It seems that he left early.

        High hedging:
            He did leave early even though it seems otherwise.

        Opposite of high evidentiality:
            It seems that he did not leave early.

Thus, hedging and evidentiality are distinct modalities. <span id="S16_7"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 16.7 Order and Scope of Disjuncts

When more than one disjunct is used in a clause, their order will depend on their scope; i.e., the amount of information that is completely encompassed by the meaning of the disjunct. This order is quite strict and cannot be violated without generating gibberish.

The syntax of the interlingua is purely right-branching and the examples below will reflect this. (For a left-branching language, the order would have to be reversed.)

A register disjunct indicates the speaker's attitude towards his audience, and not towards what he is saying. Thus, it has the outermost scope and must be the very first word in the clause.

Modal disjuncts indicate the speaker's attitude about the entire embedded event. However, the argument of the modality can occur at different times, and the modality itself can also occur at different times. This means that modal and tense-aspect disjuncts can appear in any order, as long as they make sense. Here are some examples:

        Bimo capa you study the lesson.
        You had to start studying the lesson.

        Capa bimo you study the lesson.
        You started to have to study the lesson.

        Bimo kunpa you study the lesson.
        You have to have been studying the lesson.

Note that the last example is **deontic**, not epistemic (both interpretations are possible in English). In other words, it can be paraphrased "It was obligatory for you to have been studying the lesson". <span id="S16_8"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 16.8 Imperatives

There is special type of deontic modality that represents an *imperative* from the speaker that a hypothetical situation should or should not be brought about. The best example is a simple command, such as "Go away!".

An imperative is like deontic obligation in that it indicates that something should be done. However, it goes beyond deontic obligation by actually commanding the listener to do something.

In the interlingua, we will allocate the special part-of-speech morpheme "-doy" to convert a verb to an imperative. Specifically, the part-of-speech suffix "-doy" will be a short form for the normal verb suffix "-da" plus the 2nd person deictic "femi" or "nifemi" meaning 'you' as the implied subject. Here is an example:

        Bume canzanvyudoy licandi
        not  open       the window
        Don't open the window!

Note that an imperative is always directed at the listener, even if the speaker is demanding action by a third party, as in the following example:

        Fivyudoy  moykyu   nikoncindi may
        cause     leave    teachers   now
        Have the teachers leave now!

In other words, it is always the listener that is being given responsibility for the action.

Now, some languages that have a distinct morphology for imperatives can also apply them directly to first and third persons. The ones that I am familiar with generally have the meaning 'let ...' as in "Let them leave if they really want to". However, these are not true imperatives. They are either permissives (i.e. undefined deontic obligation "mo"), or non-deictic disjuncts derived from appropriate mental state verbs expressing a sense of frustration or resignation. For imperatives that include the speaker (e.g. "Let's all leave now!"), we can use "fivyudoy" and an embedded sentence whose subject is "jomi", meaning inclusive (1+2) 'we/us'. <span id="S17_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 17.0 Anaphora

\[This chapter is a compilation of a few articles I posted to the 'conlang' email discussion list in October 1993. Rather than spend a lot of time re-writing it to make it conform to the general style of this monograph, I decided to be lazy, and am inserting the original material with only some minor editing.\]

An anaphor is a word that refers back to a another word, phrase, or clause that preceded it. For example, in "John doesn't like apples. He prefers pears.", "he" is an anaphor for "John".

One of the problems that many people have is that they tend to think of anaphora as belonging to a special, closed class of words. In English, we think of third person pronouns ("he", "she", "it", etc.), auxiliaries ("be", "have", and "do") and a handful of oddballs ("herself", "each other", "so", "such", etc.) as most of the available anaphora. Here are some examples:

        I love anchovy ice cream.  Do you?
        (Anaphor: "do")

        William Shakespeare lived in a small town with his pet rock
        and his wife Fifi Yokohama.  He would not eat veggies, she
        would not eat vegemite, and IT didn't eat at all.
        (Anaphora: "his", "he", "she", and "IT")

        John said he'll definitely attend the class on Creative
        Suffering.  Louise will too.
        (Anaphor: "will")

However, these 'closed class anaphora' are not the only ones. Consider the following:

        1. Ten theoretical physicists and eight sanitary engineers
        attended the seminar.  They were constantly heckling them.

Obviously, we can't use the anaphora "they" and "them" in the second sentence of (1). Instead, we need something like:

        2. The engineers were constantly heckling the physicists.

The point, though, is that the expressions "the engineers" and "the physicists" in (2) are anaphora, and they can continue to be used as such throughout the remainder of the dialog. Thus, the headword of a phrase is used as a referent for the entire phrase. Since these anaphora are actually nouns, which are open class words, I'll call them *open class anaphora*.

Sometimes, especially when writing, we define new open class anaphora explicitly, as in:

        3. This contract is between Steven Speedemon (henceforth
        the first party) and Wendall Whiplash (henceforth the
        second party)...

In (3) the anaphora are explicitly defined as "the first party" and "the second party". But we can also do it in informal writing and speech:

        4. Ten computational linguists and ten theoretical linguists
        attended the seminar.  The comps were constantly heckling
        the theos.  Finally, the theos got so angry that they
        mooned the comps and left.

Another common (and much more formal) way to create open class anaphora is to use single letters or abbreviations:

        5. In discussing the "Best Artificial Language Linguists
        Ever Designed" (BALLED), the designers forgot that there
        were many other lingwackos out there, who were out to get
        BALLED and who would ridicule it at every opportunity.

Of course, once an abbreviation becomes recognizable without introduction, it will no longer be an anaphor - it will be a proper noun (like USA, IBM, etc).

The major difference between the open (O) and closed (C) classes of anaphora is that the Os tend to keep their referents throughout the discourse, while the referents of the Cs are constantly changing. Thus, the anaphor "BALLED" in (5) will refer to the same thing throughout the dialog, while anaphora such as "he", "do", or "each other" will continually take on new meanings.

One other thing should be mentioned. Most anaphora are "backward-referring"; that is, the anaphor refers to something that was mentioned earlier. In English, it is also possible to have "forward-referring" anaphora, as in:

        6. After ordering a pint of his favorite ale, Robert was
        perplexed when the barmaid replied that the fishmonger
        was next door.  The Great English Vowel Shift had begun.
        [Thanks to Jim McCawley for this one!]

In (6) "his" precedes its referent "Robert". Forward-referring anaphora are sometimes called *cataphora*.

So, how do you handle anaphora in an interlingua intended for machine translation? In my opinion, the simplest, most natural, and most flexible solution is to use a form of contraction. The result would always be immediately recognizable as an anaphor by its form. The contraction could then be used as an anaphor for the entire phrase from that point on. We will modify this rule to allow the contraction to take on a new meaning if its pattern matches a new and different phrase. Here's how something like this might sound in English:

        The Sheboygan Bandits and the Milwaukee Dragoons
        faced off at Lovemud Stadium on Sunday.  The Mil-goons
        beat the She-its out of their expected title.

In the interlingua, an anaphor will have two parts: the first morpheme of the **root** of the headword of the expression it refers to plus "h" plus the part-of-speech suffix. If the headword of a clause is not a verb (i.e., a tense/aspect word, modal word, or any other deictic disjunct), then the anaphor will be formed from the clause's verb, even though, technically, the disjunct is the actual headword.

For example, consider the following examples (assume a right-branching word order):

        niledi  gukado
        bees    busy
        "the busy bees"
        anaphor = "lehi"

        Kunpa           filoda mi pyosude joydi
        past-imperfect  swim   I  to      boat
        "I was swimming to the boat."
        anaphor = "fiha"

In the first example, note that we used "le" for the anaphor, because the anaphor must be formed from the root, **not** the prefix. In the second example, we formed the anaphor from the verb "filoda" rather than from the disjunct "kunpa".

Anaphora may be formed from verbs (ending = "-ha"), nouns (ending = "-hi), and adverbs/case tags (ending = "-he"). It is not legal to form anaphora of words that appear with other parts-of-speech, such as adjectives, deictic disjuncts, previous-word-modifiers, and so on. \[However, it *is* possible to form an anaphor from a conjunction, as we will see below.\]

An anaphor of a noun may change its part-of-speech to adjective to obtain a genitive meaning. For example, if the anaphor "lehi" refers to 'busy bees', we could say something like "Lehi were angry at the bear that ate leho honey", meaning 'They were angry at the bear that ate their honey'.

An anaphor can **not** undergo further derivation by adding prefixes or suffixes. Thus, if we need to create a genitive anaphoric noun, we must use "po", as in the following example:

        A: Koncindi (= the teacher) sent me to get the reports.
        B: Rehi me Bill are here and rehi konho are over there.
           = Bill's are here and the teacher's are over there.

In the above, "rehi" is an appropriate anaphor of "reports". Thus, "rehi me Bill" is a genitive anaphoric noun phrase equivalent to "those of Bill" or simply "Bill's". Note that "rehi konho" can also be rendered "rehi me konhi".

Anaphora of verbs and adverbs/case tags may not change their part-of-speech.

An anaphor of an adverb will most often correspond to the English expressions "thusly" or "in that way/manner". However, "then" will be generated for temporal referents, "there" for locative referents, and so on. If an anaphor of a case tag is used, its meaning will include the case tag plus its argument(s).

Similarly, an anaphor of a verb will refer to the verb and all of its arguments. But the anaphor itself can never be a stand-alone sentence or take any arguments of its own (either core or oblique). The same applies to anaphora of case tags. For example, the sentence:

        John konlovu his son to swim
        = John taught his son to swim.

could be immediately followed by:

        I know konha because his wife told me.

where "konha" is the anaphor for the complete first sentence. Thus, "konha" would be translated as 'it', 'this', or 'that'.

The anaphor of an open noun must end in "-hi", **not** "-haw", since the anaphor itself is not open and cannot take any arguments.

Since abbreviations (i.e., "open" anaphora) are essentially proper nouns, we'll deal with them later in the chapter on [Proper Names, Borrowed Words, Abbreviations, and Vocatives](#S24_0).

There will be times when an anaphor of a coordinated structure will be needed. Here are two examples:

        a. The engineer and his assistant just left.  THEY had to go
                to work.
        b. The windows broke and a wall fell in.  IT was a terrible
                experience.

An anaphor of a coordinated structure will be formed from the first morpheme of the first conjunction plus 'h' plus the appropriate part-of-speech. For example, if the word meaning 'and' is "pye", then the anaphor meaning 'THEY' in (a) will be "pyehi", and the anaphor for 'IT' in (b) will be "pyeha". \[We'll have more to say about [conjunctions](#S21_0) later.\]

It is illegal to form an anaphor of a 1st or 2nd deictic pronoun or of a coordinated structure that contains one. Here is an example:

        The engineer and I worked in the computer room.
        WE finished the job in less than two hours.

Here, the correct anaphor for "we" is the 1+3 deictic pronoun "domi". Use of the anaphor "pyehi" would either be illegal or would refer to someone else. In other words, anaphora can only refer to purely 3rd person entities (including events and oblique arguments).

Forward-referring anaphora (i.e. *cataphora*) are not really necessary in a language and are illegal in the interlingua.

It is also illegal to use an anaphor instead of a reflexive construction. Here is an example:

        Samantha looked at herself in the mirror.
        *Samantha looked at sahi in the mirror.

where "sahi" is an appropriate anaphor of "Samantha". \[We'll discuss how to create [proper nouns](#S24_0) later.\] Reflexive constructions must use the suffix "-say", an appropriate reflexive word (such as "masay"), or an AP verbal derivation.

It's important not to confuse anaphora with deictics. Deictics, as we discussed earlier, are pointers to entities **external** to the discourse (e.g. this book, there, yesterday, you, then, etc.). Anaphora, however, are pointers to entities **internal** to the discourse (e.g. I saw Louise before SHE left, THAT is why she was so upset, IT caused all kinds of problems, etc.). Natural languages often use third person deictics for both functions (e.g. deictic: "Please hand me THAT book" vs. anaphoric: "I knew THAT").

In the system presented here, deictics and anaphora are completely different, intentionally, because their semantics are completely different. This implies that the speaker should be careful to use deictics only where appropriate. Deictics are essentially pointers. For example, the 3rd person plural personal pronoun "nigimi" literally means 'those entities over there'. Thus, the word "they" is a deictic in "(Speaker points to some people nearby) who are THEY?", while "they" is an anaphor in "I saw Bill and Mary yesterday. THEY just bought a new house." With the system presented here, third person personal pronouns will hardly ever be necessary. Instead, anaphora will almost always be used in their place. Some people may find this distinction a difficult one to master, especially if their native language allows third person deictics to be used as anaphora.

However, the problem is not quite as severe as it may seem. Keep in mind that third person deictics refer to entities other than the speaker or listener. Thus, their meaning automatically **includes** any anaphoric referent. It is for this reason that many natural languages use third person deictics as anaphora. In other words, third person referents are usually both internal **and** external to the discourse. Thus, either an anaphor or a deictic can be used. However, in the system presented here, an anaphor is never ambiguous, whereas a third person deictic can definitely be ambiguous. Consider the following:

        Bill visited John yesterday.  He was totally drunk.

If you use an anaphor, "he" will have only one possible referent. If you use a deictic, "he" can refer to either "Bill" or "John". It could even refer to someone other than Bill or John.

Thus, use of deictics in place of anaphora for third person referents is semantically correct, but may be ambiguous. However, even in cases where ambiguity is unlikely, I feel that use of deictics in place of anaphora should be discouraged.

Note that the above comments apply only to deictic pronouns and their genitive forms. Locative and temporal deictics are never ambiguous, and demonstratives simply imply an association, even though the association often ends up being locative. Consider the following:

        Bill: I used the red car.
        Mary: I don't like that car because it's a gas guzzler.

In the above, the word "that" should be demonstrative "giju", even though it is not locative. In other words, a first person demonstrative implies an unspecified association (not necessarily a location!) with the speaker, second person implies an association with the listener, and third person implies an association with someone or something else. <span id="S18_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 18.0 Relative Clauses and Resumptive Pronouns

In my earlier [essay on syntax](http://www.eskimo.com/~ram/syntax.html), I discussed two kinds of relative clause that are most common among natural languages. The first kind, which is found in a large minority of natural languages (including English), uses a single relative conjunction (e.g. "which", "that", or "who") plus a *gap*, as in the following example:

        John saw the book WHICH Bill bought (gap).

Note that "the book" is the object of the verb "saw", as well as the implied object of the verb "bought". The gap is required by English syntax.

The second kind of relative clause, which is found in a slight majority of natural languages, uses a relative conjunction plus a *resumptive pronoun*, as in the following example:

        John saw the book WHICH Bill bought IT.

Here, the gap is filled by the resumptive pronoun "IT" that refers back to "the book".

The use of resumptive pronouns has one disadvantage compared to the use of gaps, but has four advantages. The single disadvantage is that an extra word is needed; i.e. the resumptive pronoun (RP) itself. The advantages are as follows:

        1. ANY noun can be relativized, regardless of the function it
        performs in the embedded sentence, or of the number of functions
        it performs:

            Gap: *I saw the car WHOSE driver got thrown from.
            RP:  I saw the car WHICH ITS driver got thrown from IT.

        Here, "IT" is the resumptive pronoun and has the morphological form
        of a noun. "ITS" is the possessive form of the resumptive pronoun.

        2. ANY noun can be relativized, regardless of how deeply the gap or
        resumptive pronoun is embedded:

            Gap: *This is the man WHO Louise bought a car from the same
                    dealer that sold a Cadillac to.
            RP:  This is the man WHO Louise bought a car from the same
                    dealer that sold a Cadillac to HIM.

        Here, "HIM" is the resumptive pronoun and unambiguously links to
        "the man".

        3. Use of a resumptive pronoun allows it to be combined with other
        nouns in coordinated structures:

            RP: I just met this real tall guy WHO my sister dated both
                    HIM and HIS real short brother.

        4. Computer parsing of relative clauses using resumptive pronouns is
        much easier.  Parsing gaps can be extremely complicated, and can
        often fail completely without even more complicated semantic/
        contextual processing.

In order to deal with the above examples, languages like English must split them up into two or more sentences. For example, the third example would have to be something like this:

        My sister dated this real tall guy and his real short brother.
            I just met the tall one.

Since the advantages of resumptive pronouns significantly outweigh the single disadvantage, the interlingua will implement relative clauses with resumptive pronouns. <span id="S18_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 18.1 Implementation of Relative Clauses

We need to create only three basic words to completely implement relative clauses that use resumptive pronouns: a relative conjunction, a resumptive pronoun, and a genitive/adjective form of the resumptive pronoun.

A relative conjunction simply provides a genitive link between a noun and the relative clause that modifies it. Thus, it performs exactly the same function as the genitive linker "po" which we've used extensively so far. The difference, though, is that we've always used it to link two noun phrases. However, there is no reason why the argument of "po" cannot be an embedded clause. In other words, the genitive linker "po" performs the function of the English genitive preposition "of" when followed by a noun phrase, and performs the function of the English relative conjunctions "that/who/which" when followed by an embedded clause. This is more easily understood if we paraphrase these functions as in the following examples:

        Billy's toys
        = the toys 'of-the-entity' Billy

        the boy "who" broke the window.
        = the boy 'of-the-event' he broke the window

Note that, while this approach may seem odd to speakers of English, it is semantically correct. In fact, many natural languages (most notably Mandarin Chinese) use exactly the same approach.

Thus, in the interlingua, we will use the following:

        Relative conjunction:   me

For the resumptive pronoun and its genitive form, the obvious choice is to use an anaphor. (And since I will be using English for my examples, I will simply use the corresponding English anaphor, capitalized; i.e., "HE", "HER", "THEIR", etc).

Here are a few examples:

        The shirt "po" you want IT is on the bed.
        = The shirt that you want is on the bed.

        The police caught the man "po" HE robbed the bank.
        = The police caught the man who robbed the bank.

        Here's the hammer "po" he broke the window with IT.
        = Here's the hammer that he broke the window with.

        They examined the room "po" the fire started in IT.
        = They examined the room that the fire started in.

Note that "po" can be glossed in English as either "who", "which", or "that", depending on its referent.

Here are some examples using genitive forms:

        That's the man "po" the police just arrested HIS wife.
        = That's the man whose wife the police just arrested.

        That's the man "po" HIS wife was just arrested by the police.
        = That's the man whose wife was just arrested by the police.

In summary, there is no need to create special words, morphemes, or syntax to deal with relative clauses. Features already available in the language are more than capable of handling the task. <span id="S18_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 18.2 Nominal Relative Clauses Using "podaw"

Relative clauses can either **modify** nouns or noun phrases, or **act** as noun phrases. Those that act as noun phrases are usually called *nominal* or *headless* relative clauses. In the interlingua, these can be easily implemented by using the open noun form of the relative conjunction rather than the open adjective form. In other words, we can use "podaw" instead of "po". In addition, since "podaw" contains both the relationship **and** the referent, the anaphor will always be "pohi" or "poho" (genitive). Here are a few examples:

        I know WHO broke the window.
        = I know MEDAW MEHI broke the window.

        They saw WHAT John brought.
        = They saw MEDAW John brought MEHI.

        She showed me WHERE the boys went.
        = She showed me MEDAW the boys went pyosude MEHI.
        [Here, "pyosude" is the 'destination' case tag that we derived
        earlier.  Literally, the sentence can be glossed as 'She showed
        me what the boys went to it'.]

        He told me WHO he bought the book for.
        = He told me MEDAW he bought the book mase MEHI.
        [Here, "mase" is the 'beneficiary' case tag.]

        You told me WHY you sold it.
        = You told me MEDAW you sold it mave MEHI.
        [Here, "mave" is the 'reason' case tag.]

        Bill told me HOW he did it.
        = Bill told me MEDAW he did it guswa MEHI.
        [Here, "guswa" is the 'instrument/means/method' case tag.]

        I don't like THE WAY you behaved yesterday.
        = I don't like MEDAW you behaved cituswa MEHI yesterday.
        [Here, "cituswa" is the 'manner' case tag.]

Note that "podaw" can be paraphrased as "the person/place/time/thing which" or simply "that which". Thus, for nominal relative clauses, the open noun form of the relative conjunction acts as both the relative conjunction and the argument of the preceding verb. <span id="S18_3"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 18.3 Nominal Relative Clauses Using Inverse Case Tags

It's also possible to use derivations of the case tags directly, without a relative conjunction. In order to do this, however, we must invert the case tag, convert it to a noun, and then open up its argument structure. For example, the P/F-s locative case tag "pyo" can be paraphrased as 'being at/in'. Thus, the **open** F/P-s inverse noun form "pyokwedaw" means simply 'the location where'. In other words, the argument of the open noun (i.e. the embedded sentence or the patient of the embedded sentence) will be the patient of the inverted locative:

        She showed me WHERE the boys bought the magazine.
        = She showed me PYOKWEDAW the boys bought the magazine.
        [Literally, this can be glossed as 'She showed me the location
        where the boys bought the magazine'.]

Let's do the same for the other examples that used case tags:

        He told me WHO he bought it FOR.
        = He told me MASEKWEDAW he bought it.
        [In English, this can be closely rendered as 'He told me the
        beneficiary for whom he bought it'.]

        You told me WHY you sold it.
        = You told me MAVEKWEDAW you sold it.
        [This sentence can be glossed as 'You told me the reason for
        your selling it'.]

        Bill told me HOW he did it.
        = Bill told me GUSWAKWEDAW he did it.
        [This sentence can be glossed as 'Bill told me the method of his
        doing it'.]

        I don't like THE WAY you behaved yesterday.
        = I don't like CITUSWAKWEDAW you behaved yesterday.
        [This sentence can be glossed as 'I don't like the manner in
        which you behaved yesterday'.]

The astute reader may now be wondering why there is any need *at all* for a relative conjunction, since we can use an appropriate **open adjective** in its place. Here is an example:

        I saw the building that he was walking towards.
        = I saw the building "po" he was walking pyosude IT.
                OR
        = I saw the building PYOSUKWEDU he was walking.
        [Literally, 'I saw the building towards which he was walking.]

In other words, we can take advantage of the perfect symmetry inherent in the way we are designing case tags. If a case tag can link an argument of a main verb or the entire clause to its own argument, the inverse form can perform the exact reverse operation. This is exactly what we did in the last example. Thus, the inverse open adjective form can be paraphrased as 'X-which', where "X" is a case tag. Here's another example:

        There's the girl that he bought the flowers for.
        = There's the girl me he bought the flowers mase HER.
                OR
        = There's the girl MASEKWEDU he bought the flowers.

Here, "masekwedu" is exactly equivalent to English "for whom".

However, the above approach cannot be used with the special case tags "mavo", "mavoy", "masi", and "makay", because they simply provide an oblique version of a primary argument of their head and do not have real argument structures. <span id="S18_4"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 18.4 Non-Restrictive Relative Clauses

All of the relative clauses we've discussed so far are typically referred to as *restrictive* relative clauses, since they 'restrict' or 'reduce' the number of possible referents of the head noun. Some languages, such as English, allow the same form to be used with a non-restrictive sense (but with a noticeable difference in timing and intonation). These clauses simply provide additional information about the head noun. Here are a few examples:

        Restrictive:      The man who robbed the bank...
        Non-restrictive:  The elephant, which is a large animal, ...

        Restrictive:      The mower that is in the garage is broken.
        Non-restrictive:  The mower, which is in the garage, is broken.

Since a non-restrictive relative clause is the same as any other kind of parenthetical structure, it should be treated as such. It should **not** be treated in the same way as a restrictive relative clause, for the simple reason that the two are semantically quite different. \[I will discuss how to deal with [parenthetical structures](#S21_4) later.\] <span id="S19_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 19.0 Interrogatives

In the chapter on [Modality](#S16_0), we introduced interrogative modals (meaning 'what degree of modality applies') along with the general sentential interrogative "meki" (meaning 'Is it true that...'). We now need to address how to implement other interrogatives, in which the listener is being asked, in effect, to "fill in a blank". Here are some English examples:

        WHO closed the window?
        WHY did he close the window?
        HOW did he close the window?
        WHERE did he close the window?

We also need interrogative modifiers, as in the following:

        WHICH boy closed the window?
        WHAT kind of people live here?
        HOW many people live here?
        HOW heavy was the box?

In order to create interrogative sentences, we used the very general interrogative deictic disjunct "meki". We can naturally extend the use of "-ki" by suffixing it to the generic root "ma". "Maki" will be a "0" structure adjective by default, and is equivalent to the interrogative English adjective "which". The noun form, "madiki", means 'what'. Note that this is similar to what we did when we derived the impersonal forms "ma", "madi", "made", "buma", etc.

When referring to people, we can suffix "-ki" to the root meaning 'person' = "ce". Thus, "ceki" corresponds to the interrogative English pronoun "who". Other parts-of-speech will also be useful, as we'll see below.

We will also apply the following rule:

        When "-ki" is suffixed to a stem whose argument structure is
        open (i.e. verbs, case tags, open nouns, etc), then it will be
        equivalent to "madiki" appearing in the rightmost unfilled
        argument slot.

Here are some examples:

        Who opened the window?
        = Ceki canzanvyu the window?
        [Here, "canzanvyu" is the A/P-d verb meaning 'to open'.]

        What did Billy open?
        = Billy canzanvyuki?
        = Billy canzanvyu madiki?

        Who opened what?
        = Ceki canzanvyuki?
        = Ceki canzanvyu madiki?

        Why did he open the window?
        = He canzanvyu the window maveki?
        = He canzanvyu the window mave madiki?
        [Here, "mave" is the reason case tag.]

        How did he open the window?
          OR With what did he open the window?
        = He canzanvyu the window guswaki?
        = He canzanvyu the window guswa madiki?
        [Here, "guswa" is the instrument/method case tag.]

        Where did he open the window?
        = He canzanvyu the window pyoki?
        = He canzanvyu the window pyo madiki?
        [Here, "pyo" is the locative 'at/in' case tag.]

        How heavy is the box?  or  What does the box weigh?
        = The box bonxesaki?
        = The box bonxesa madiki?
        [Here, we are using the P/F-s verb "bonxesa", meaning
        'to weigh'.  As we discussed earlier in the chapter on
        Counts and Measures, it is the P/F-s verb form of the
        P-s adjective "bonxedo" meaning 'heavy'.]

For the English expression 'how many' or 'how much', we need to use "-ki" with the numeric root "mu" in exactly the same way we derived the non-specific numeric words. Here are a few interrogative examples:

        How many boxes are there (= the boxes number how many)?
        = There are muki boxes?

        How many people live here?
        = Muki people live here?

In other words, when "-ki" is used as a modifying concept, we are asking the listener to indicate the actual "position" among the various possibilities. Thus, for example, the simple adjective "maki" corresponds exactly to the English word "which/what", and "caboki" corresponds to 'which duck(s)'. Here are some examples:

        Which duck opened the window?
        = Maki cabodi canzanvyu the window?
                OR
        = Taboki canzanvyu the window?

        Who is a duck?
        = Ceki zizada cabodi?  ["zizada" = verb 'to be'.]
        = Ceki tabosya?
        [Literally: "Which person is a duck", where "ce" is the root
        meaning 'person'.]

        Whose duck is that?
        = Cabodi me madiki is that?
                OR
        = Cabodi me ceki is that?

        How is it that the duck lives here?
        = Cabodi live here madeki?
        [In essence, "madeki" asks "what other oblique arguments can
        be added to this verb?".  Do not confuse this with the more
        explicit instrument/means/method construction "guswaki" = 'with
        what', 'how', or 'by what means/method'.]

In summary, "madiki" (or a derivative) occupies the position of a missing word or expression that would have provided more detailed information, while indicating that it should be replaced by something more specific. <span id="S19_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 19.1 More on Nominal Relative Clauses

English speakers should be careful not to confuse the use of "-ki" derivations with English equivalents that are not truly interrogative. Consider the following from the previous chapter:

        Bill told me HOW he did it.
        = Bill told me GUSWAKWEDAW he did it.
        [This sentence can be glossed as 'Bill told me the method of his
        doing it'.]

Note that "how" is not a true interrogative.

Now consider the following:

        How much money do you have?
        I know how much money you have.

The first sentence uses the true interrogative "muki". In the second, however, "how much" literally means "the amount/quantity of", which is NOT an interrogative even though it appears to be in English. The equivalent of "the amount/quantity of" in the interlingua is the open noun "musadaw".

Now, here's another one:

        How much do you like the teacher?
        I know how much you like the teacher.

The first example uses the particle "mwaki" to modify the verb "like" because it is asking for the degree of "liking". The second example, however, cannot use "-ki" because it's not a true interrogative. Instead, we will use an appropriate derivative of non-interrogative "mwa":

        mwasade  = 'to the degree/extent of/that' (P/F-s case tag)
        mwasadaw = 'degree or extent of/that' (open noun)
        mwasadi  = 'degree or extent' (noun)

Thus, the second example in the interlingua would look like this:

        I know mwasadaw you like the teacher.

Finally, let's do one more:

        Whose book are you reading?
        I know whose book you are reading.

Here, we have to restate the sentence as "I know the person who you are reading his book", where "his" is an anaphor for "person". Note also that, in this example, the syntactic object of "know" is "book", but the semantic object is **not** "book" - it's actually the person associated with the book.

Similar kinds of periphrasis will be needed for other non-interrogatives that use interrogative words in English. <span id="S20_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 20.0 Abstract Relationships

There are several abstract relationships that are often discussed in the technical literature on semantics. Their simplest and most basic forms are all P/F-s verbs. I will simply list them and provide examples of their use. By now, potential derivations using these words should be obvious.

Here is a partial list:

        Association:

            P/F-s   -> 'to have an unspecified relationship with', 'to be
                    involved with', 'to have something to do with'

            [This, of course, is the verb "tuda".]

        Equality:

            P/F-s   -> 'to be', 'to be equal to', 'to be the same as'
                    E.g.  John is the new president of the company.

            [This is the verb "zizada", which we derived earlier when we
            discussed the 'state' case role.]

        Similarity:

            P/F-s   ->  'to be like', 'to be similar to',
                            'to share/have something in common with'
                    E.g.  John is like his father.

            [This is the verb "cituda", which we derived earlier when
            we discussed the Manner case role.  We also derived some
            other useful words from the same root in the section on
            polarity.]

        Equivalence:

            P/F-s   -> 'to be equivalent to', 'to amount to', 'to be
                            comparable to'
                    E.g.  The cross-border raid was equivalent to an act
                            of war.

            [I'm not sure if this relationship is really necessary, since
            the equality relationship (i.e. "zizada") seems to cover the same
            semantic territory.  However, there does seem to be some
            difference.  Compare the above example with "The cross-border
            raid WAS an act of war".  But we can also get a sense of
            equivalence from the similarity relationship, as in "The
            cross-border raid was LIKE an act of war".  And when we add the
            'maximum' scalar polarity semi-root "bi-" to "cituda", we get the
            sense 'identical', as in "The cross-border raid was IDENTICAL to
            an act of war".  So we really don't need to define a unique
            equivalence relationship.  Derivations based on "zizada" or
            "cituda" should provide us with all of the distinctions we
            need.  TBD.]

        Analogy:

            P/F-s   ->  'to be analogous to'
                    E.g.  A dog's relationship to a puppy is analogous to
                                    a cat's relationship to a kitten.
                            (i.e. A dog is to a puppy as a cat is to a
                                    kitten.)
                            Execution for murder is analogous to fines for
                                    petty theft.
                            (i.e. Execution is to murder as a fine is to
                                    petty theft.)

        Proportionality:

            P/F-s   ->  'to be proportional to'
                    E.g.  Volume is proportional to the radius cubed.

        Paronymy:

            P/F-s   ->  'to be the source of', 'to provide/supply'
                    E.g.  -> This mine provides gold and platinum.

            Inverse F/P-s  ->  'to derive/come from', 'to be a derivative of'
                    E.g.  Kerosene is a derivative of crude oil.

            [Incidentally, P is referred to as the base, while F is
            referred to as the paronym.]

        Hyponymy:

            P/F-s   ->  'to be a kind/type/variety/subtype/example of'
                    E.g.  A horse is a kind of mammal.
                          A dialect is a variety of a language.

            Inverse F/P-s  ->  'to subsume', 'to include'
                    E.g.  Mammals include horses, dogs, and cats.

            [Incidentally, P is referred to as a hyponym of F, and
            F is referred to as a superordinate of P.  Thus, 'horse'
            is a hyponym of 'mammal', and 'mammal' is a superordinate of
            'horse'.]

        Relatedness:

            P/F-s   ->  'to be related to', 'to be in the same class as'
                    E.g.  Cats are related to dogs, both being mammals.
                            Magpies are related to crows.

        Compatibility:

            P/F-s   ->  'to be compatible/consistent/go together with'
                    E.g.  My views are compatible with yours.
                          His approach is consistent with his earlier
                                    work.

        Constituency or Partitive relationship:

            P/F-s   ->  'to be part/element/component/member/constituent of'
                    E.g.  A finger is part of the hand.

            Inverse F/P-s  ->  'to consist of', 'to have (as a component or
                                    part)', 'to be made (up) of', 'to
                                    constitute', 'to embody'
                    E.g.  The doghouse is made mostly of plywood.
                          A triangle has three angles.

            [Incidentally, P is referred to as the meronym of F,
            while F is referred to as the holonym of P.  Thus,
            'finger' is a meronym of 'hand', and 'hand' is a holonym of
            'finger'.]

        Purpose:

            P/F-s   -> 'to be the purpose/objective/goal/aim/point/intent
                            of', 'to be intended to/for'
                    E.g. The purpose of the catalyst is to increase the
                            reaction rate.

            The root for this concept is the P/F-s "caza".  From it, we can
            also derive the very useful purpose case tag "cazade"
            with the meaning of English "(in order) to", "so that", "in
            order that", "for (the sake/purpose of)", and so on.  Similarly,
            the AP/F-s verb "cazaka" means 'to intend/aim/mean/plan to' or
            'to figure on'.

        Readiness:

            P/F-s   -> 'to be ready/fit/prepared/adapted to/for'
                    E.g. The new classrooms are ready for the students.
                         The children are ready to leave now.

            The root for this concept is the P/F-s "xotu".  From it, we can
            also derive the very useful case tag "xotude", meaning 'in
            case (of)', as in the following sentences:

                I brought a book IN CASE the flight is delayed.
                We should buckle our seatbelts IN CASE OF accident.
                A flashlight was on the table IN CASE OF a power outage.

            We can also derive words such as A/P/F-d "xotuvu", meaning
            'to prepare/adapt to/for', as in "I prepared the children for
            school", and "xotuku", meaning 'to get ready or prepare/ready
            oneself to/for'.

        Supplementation:

            P/F-s   -> 'to be in addition to', 'to be an adjunct or
                            supplement to', 'to be an augmentation of'
                    E.g. The money is a supplement to the normal wage.

        Alternativity:

            P/F-s   -> 'to be an alternative to/for'
                    E.g.  Compromise is the only alternative to war.

            [Alternativity implies that there is a choice among options.]

        Alternation:

            P/F-s   -> 'to alternate with', 'to take turns with'
                    E.g.  The girls take turns with the boys at the
                                    swimming pool.
                          Red flags alternate with blue flags in the row
                                    of flagpoles.

            [Do not confuse 'alternativity' with 'alternation'.  An
            alternative is an option while an alternate precedes or follows
            in temporal or locative sequence.]

        Substitutivity:

            P/F-s   -> 'to be a substitute or replacement for'
                    E.g.  John is a replacement for the former teacher.

            [Note that this relationship can be used to derive the case tag
            meaning 'instead of', 'rather than', or 'in place of'.]

        Enablement:

            P/F-s   -> 'to enable or make possible', 'to be a prerequisite
                            for'
                    E.g.  The new policy will enable us to hire better
                            engineers.

        Result:

            P/F-s   -> 'to result in, produce, lead to, yield, bring
                            forth, have as a result/outcome/product'
                    E.g.  Your stupidity resulted in lower profits.

            Inverse F/P-s   -> 'to be the result/outcome/product of'
                    E.g.  The high dropout rate is the result of overcrowded
                            classes.

            This is the root "joza".  The case tag form "jozade" has the
            meaning of the word 'that' in a sentence such as "He's so rich
            THAT he can afford a yacht".  Literally, it means 'He is
            extremely or sufficiently rich, the result being that he can
            afford a yacht'.

        Contingency:

            P/F-s   -> 'to be contingent/conditional on', 'to hinge on',
                            'to depend on'
                    E.g.  The success of the project depends on complete
                            cooperation.

            Inverse F/P-s  -> 'to entail/imply'
                    E.g.  'He shouted again' entails 'He shouted earlier'.
                            Lightning implies thunder.

            [Important: do not confuse 'contingency/implication' with
            'causation'.]

        Inherentness:

            P/F-s   -> 'P has the qualities/nature/characteristics of F',
                            'P is inherently F', 'P is F by nature'
                    E.g.  A cat is a meat-eater by nature.
                            He has the qualities of a good teacher.

            Inverse F/P-s -> 'to be inherent to', 'to be an inherent quality
                                                            of'

            [This relationship is represented by the root "jitu".  We can
            also derive the interrogative adjective "jituki" with the
            meaning 'what kind of' (literally 'being by nature what?').  The
            interrogative verb "jitudaki" means 'What is a', as in "What is
            a duck?" (literally, 'A duck is by nature what?' or 'What is the
            nature of a duck?').]

        Meaning:

            P/F-s   -> 'to mean', 'to signify', 'to stand for', 'to denote',
                            'to indicate', 'to represent'
                    E.g.  The French word "maison" means 'house'.
                          His behavior signifies that he is very angry.

And I'm sure there are many others.

Note that all of the technical labels that we introduced above, such as "paronym", "meronym", and "superordinate" can be easily derived from the active and inverse forms of the corresponding verbs. <span id="S21_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 21.0 Conjunctions

A conjunction links two entities or situations, and always provides additional information about the relationship between the items being linked. Also, some conjunctions can be concatenated to link more than two items. Here are a few examples:

        Louise AND Bill just left.
        Louise OR Bill OR Mike will give the talk.
        Bill will go shopping IF Louise wants him to.
        John just went shopping, BUT he forgot to buy coffee.
        He bought the book EVEN THOUGH it was very expensive.
        He was the only one who was sober, SO he had to drive.
        He finished his homework at 7 PM, AND THEN he went outside to
                play.
        Bill missed the target; IN OTHER WORDS, he lost the match.

Conjunctions **always** link two expressions of the same syntactic type. For example, if a noun phrase immediately follows a conjunction, the conjunction links it to one or more preceding noun phrases. If a complete clause immediately follows a conjunction, the conjunction links it to one or more preceding clauses. And so on.

Conjunctions can be grouped into the following general categories:

        Additive:
                and, also, in addition, besides, furthermore, moreover,
                similarly, likewise, in the same way, in other words, in
                conclusion, in summary, etc.

        Causal:
                if, then, unless, even if, so, consequently, thus, it
                follows, because, under the circumstances, for this
                reason, therefore, etc.

        Concessive/Adversative:
                but, and even, in spite of, however, although, albeit,
                notwithstanding, anyway, nevertheless, even though,
                regardless, even so, despite, just the same, even now,
                for all that, still, all the same, yet, whether or not,
                whatever, no matter what, in fact, as a matter of fact,
                despite that, on the other hand, etc.

        Substitutive:
                or, instead of, rather than, in place of, etc.

        Temporal:
                then, next, after that, finally, afterwards, before
                that, at last, at the same time, subsequently, etc.

        Continuatives/Cohesives:
                uh, now, well, anyway, okay, at any rate, in any case,
                etc.

\[Incidentally, the above categories reflect **linguistic/discourse** distinctions based on actual usage in natural language, as opposed to **logical** distinctions. Logicians categorize conjunctions quite differently, and, in the process, end up excluding words and expressions that are truly conjunctive in nature, or end up restricting their meanings more than natural languages do. For example, most logicians and formal semanticians would not consider expressions such as "in other words", "afterwards", "on the other hand", and "anyway" as actual conjunctions, because they do not perform basic logical operations on truth conditions. In natural language, however, these **are** conjunctions and they perform important conjunctive discourse functions.\]

Conjunctions are interesting because of their large numbers and because of the great variety of relationships that they represent. Also, the vast majority of them are derived from basic, open class words. Thus, while conjunctions **do** perform a function that is quite different from verbs, nouns, adjectives, etc., their meanings include the concepts of many of these words. <span id="S21_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 21.1 Implementing Conjunctions

Conjunctions fall into three general categories depending on how they are used:

> 1\. True conjunctions. These always link a constituent which follows the conjunction with the closest preceding constituent of the same type (i.e., clause with clause, noun phrase with noun phrase, etc). The linkage is thus syntactically precise. Examples: and, or, unless, if, etc.
>
> 2\. Normal Disjuncts. These only loosely link a sentence which follows the conjunction with one or more of the preceding sentences. The syntactic linkage is often vague. Examples: however, on the other hand, also, in other words, despite that, etc. \[Incidentally, these are normal disjuncts derived using middle voice operations. They can **never** be deictic.\]
>
> 3\. Case tags. These always link their arguments with one or more arguments in the main clause, or with the entire event represented by the main clause. Any transitive verb can be converted to a case tag.

To illustrate the difference between true conjunctions and normal disjuncts, consider the following:

        The project was over-budget and under-staffed.  The project
        manager was a political hack and his choice for a tech lead was
        a bureaucrat who could barely spell his name.  Three of the
        engineers and four of the secretaries were sick most of the
        time.  To make matters worse, the technicians had to spend most
        of their time on another project that had higher priority and
        more adequate funding.

        But the project was a great success.

Notice how "and" precisely links its arguments, creating new constituents of the same syntactic type. The syntax of the linkage is not in doubt.

But there *is* doubt about the linkage of the word "but" as it is used above. Does it link to the immediately preceding sentence, to the preceding two sentences, or to the entire preceding paragraph? If "but" were a true conjunction, there would be no doubt about which items were being linked. In effect, the semantics of "but" in the above example is not compatible with the syntax of a true conjunction since the linkage is not clear. The actual linkage can only be determined through context.

Now, since true conjunctions and disjuncts are syntactically distinct, we must treat them as distinct syntactic entities; i.e. true conjunctions must define a unique part-of-speech. (Normal disjuncts, of course, are verbs.)

However, before discussing true conjunctions, let's first look at how to derive conjunctions as normal disjuncts.

[Earlier](#S2_7_5), we looked at normal disjuncts with which a speaker could express feelings or attitudes about an event by using a verb (i.e., the disjunct) that takes an entire sentence as its single argument. For these cases, the unspoken arguments are demoted via a grammatical voice change and can **not** be precisely determined from the speech environment as would be the case with a deictic disjunct. Instead, they can only be guessed at based on the context, if at all. Here's an example:

        P/F-s           They hope that he wins.
        F-s [-P]        Hopefully he'll win.

where the normal disjunct "hopefully" is actually a verb that takes a complete embedded sentence as an argument - it is **not** an adverb as in English.

As stated earlier, many other disjuncts of this type can be derived in the same way: "to presume" -\> "presumably", "to be interesting" -\> "interestingly", "to be possible" -\> "possibly", "to be incidental" -\> "incidentally, by the way", "to be necessary" -\> "necessarily", "to be fortunate" -\> "fortunately", and so on.

In these constructions, the attitude being expressed is typically (but not always!) the attitude of the speaker. Also, these constructions almost always imply that the attitude is shared by other, unmentioned people. Thus, this type of disjunct is not truly deictic, but is vaguer and more general.

Thus, normal disjuncts can be used as conjunctions whose scope is **not** precise. For these, however, we must demote the **second** argument of the verb rather than the first argument using an anti-middle construction (suffix = "-soy"). Here is an example in the interlingua:

        P/F-s: The new project is similar to the previous one.
                            where "cituda" = 'to be similar to'
        P-s [-F]:   "Citusoyda" = 'Similarly, ...', 'Likewise...', 'In like
                            manner', etc.

Note that "Citusoyda" is a verb that takes a single core argument, even though the English translation requires a fronted adverb.

Note also that we must use an anti-middle, rather than an anti-passive, since the unmentioned argument is determinable from the context that preceded the disjunct. If we used an anti-passive instead, we would be able to specify the argument obliquely, which does not have the required semantics. In other words, when we say "Similarly, ...", we know that what follows is similar to what has already been said - **not** to something else that is optionally expressable.

Here are some more English examples:

        P/F-s:      The bazaar was in addition to the car wash.
        P-s [-F]:   Additionally, ...

        P/F-s:      The land swap was an alternative to continued
                        violence.
        P-s [-F]:   Alternatively, ...

        P/F-s:      The accident occurred after the party.
        P-s [-F]:   Afterwards, ...

        P/F-s:      His odd behavior meant that he was angry.
        P-s [-F]:   In other words, ...

        P/F-s:      Red flags alternated with white ones.
        P-s [-F]:   On the other hand, ...

Note the important differences between a verbal disjunct and a case tag. A disjunct must undergo a grammatical voice change to demote an argument, while the case tag keeps both arguments. Also, the demoted argument is not as precisely known as the first argument of a case tag. For a case tag, we know that the first argument is either the entire main clause that precedes it or one of the primary arguments of the main clause.

In sum, when a deictic disjunct is used, the unmentioned argument(s) are determinable from the speech **environment**. When a verbal (i.e., middle or anti-middle) disjunct is used, they are determinable from the speech **context**; i.e., what has already been spoken. And for a case tag, the first argument is either the entire main clause that precedes it or one of the primary arguments of the main clause.

A true conjunction should be used only when its linkage is determinable using only the rules of syntax. This will only occur when the items being linked are part of the same sentence. A disjunct should be used to introduce a sentence that is only loosely linked to the preceding one(s). A case tag should be used when its argument links to something in the same sentence which cannot be determined using only the rules of syntax.

True conjunctions can also undergo further derivation. When this is done, the root will represent the abstract state of the conjunction. Here are a few examples (all roots with classifier "-pye", a root-terminator, are true conjunctions, and are P/F-s by default):

        pye      - 'and', 'plus' (true conjunction)
        pyeda    - 'to supplement', 'to be in addition to', 'to be a
                        supplement to' (P/F-s verb)
        pyedi    - 'an addition, supplement, or increment', 'something
                        more'
        pyedo    - 'additional', 'another', 'some more', 'more' (e.g. "I
                        need three more chairs" or "I need another
                        chair".)
        pyeday   - 'more' (e.g. "nimukoy" = 'three times' and "nimukoy
                        nenday" = 'three more times')

        pyede    - 'in addition to' (P/F-s case tag)
        pyekoy   - 'also', 'too', 'as well' ("0" adverb)
        Pyesoyda - 'Besides (that)', 'Plus', 'In addition (to that)',
                        'Additionally', 'Moreover', 'Furthermore',
                        'Not only that, but...' (P-s [-F] verbal
                        disjunct)
        madiki pyesoydo - 'what more?', 'what in addition?'

        gwepye    - 'or', 'or else', 'either ... or'
        gwepyeda  - 'to be an alternative to/for'
        gwepyedo  - 'alternative', 'other'
        gwepyedi  - 'alternative' (noun), 'another'
        Gwepyesoyda - 'Otherwise' (e.g. "He'd better leave now.  OTHERWISE,
                        there'll be hell to pay.")
        madiki gwepyesoydo - 'what else?', 'what as an alternative?'

        [Note that there is no special construction in the interlingua
        for the English expression "neither ... nor", since this is just
        an alternative for "and" with a negated verb.  For example,
        "Neither John nor Michelle left early" is the same as "John and
        Michelle didn't leave early".]

The conjunction "but" has semantics very similar to "and". However, unlike "and", "but" has the further implication that the items it links are somehow in contrast to each other without itself providing any indication of the nature of the contrast (such as opposition, oddness, incompatibility, disagreement, distinction, counterbalance, surprise, differentiation, and so on).

In the interlingua, we will use the root "bupye" to represent this relationship. Here are some useful derivations:

        bupye      - 'but', 'but also' (note that this is a true
                        conjunction)
        bupyeda    - 'contrast with', 'be in contrast with'
        bupyevawdo - 'contrasting' ("-vaw" = reciprocal suffix)
        nebupyedi  - 'contrast' ("ne-" = quality prefix)
        nebupyedaw - (open noun) 'contrast between P and F'
        bupyede    - (case tag) 'even though', 'although', 'in spite of
                        (the fact that)', 'despite (the fact that)',
                        'regardless of (the fact that)', 'whether or
                        not', 'irrespective of (the fact that)',
                        'notwithstanding'
        bupyekoy   - ("0" adverb) 'anyway', 'still', '(ir)regardless',
                        'nevertheless', etc.
        Bupyesoyda - (verbal disjunct) 'But', 'Still', 'Even so',
                        'Yet', 'However', 'Nevertheless', 'Just the
                        same', 'Notwithstanding', 'For all that', 'Be
                        that as it may', etc.

We will see additional conjunctions later. <span id="S21_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 21.2 Register Variations for Disjuncts

There are many different disjuncts that have essentially the same meanings, but which are used in different settings. Natural languages differ widely in the number and nature of these expressions.

Fortunately, we can capture these distinctions without having to arbitrarily create words that will have few close counterparts in other languages. We can do this by simply changing the speech register of the more basic disjuncts by using the [register prefixes](#S14_0) we discussed earlier. Here are a few examples:

        from 'and/also/too'
                informal        -> 'besides'
                formal          -> 'in addition', 'additionally',
                                      'furthermore', 'moreover'

        from 'but/still'
                informal        -> 'whatever', 'even so', 'for all that'
                formal          -> 'though', 'although', 'however',
                                      'nevertheless', 'regardless',
                                      'notwithstanding'

        from 'even though'
                formal          -> 'despite that', 'in spite of the fact
                                       that'

        from 'well/so'
                informal        -> 'okay', 'so anyway', 'so anyhow',
                                        'anyway', 'anyhow', 'okay then'
                formal          -> 'now', 'in any case', 'at any rate',
                                        'in any event'

        from 'then (= thus)'
                informal        -> 'because of this', 'for this reason'
                formal          -> 'thus', 'therefore', 'it follows
                                        therefore that', 'consequently',
                                        'hence'

And so on. The actual distinctions between informal, formal, etc. will vary somewhat from one person to another, and the above examples reflect my own (subjective) conclusions. (Actually, I doubt if it's possible to **precisely** define the semantics of these register differences.) <span id="S21_3"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 21.3 Coordination Ambiguity

Conjunctions can be used to solve problems that sometimes show up if the syntax of an interlingua is strict and unambiguous. For example, if the syntax requires a relative clause to always attach to the closest preceding noun, you would not be able to render the following as a single sentence:

        I told him about the chicken that we had for supper that was
                killed by a coyote.

If the syntax is strict (as it is in the interlingua), then the relative clause "that was killed by a coyote" would modify the noun "supper", which is nonsense. With a conjunction, however, the problem disappears:

        I told him about the chicken that we had for supper AND that
                was killed by a coyote.

Here, "AND" links the two "that" clauses so that both modify "chicken".

If a relative clause modifies a noun phrase that is part of a coordinated pair, the linkage may be ambiguous. Consider the following:

        1. The boy and (the girl who ran away)...
        2. (The boy and the girl) who ran away...

In the interlingua, relative clauses modify only the single, closest, preceding noun by default, and conjunctions link the following item with the closest preceding item of the same type. Thus, without further information, (1) is the only possible interpretation.

If we want the relative clause to apply to the compound phrase, we could modify the relative conjunction with a modifier meaning 'both' or 'all', or something similar. However, this is not a very good solution, since parsing success would now depend on the **meaning** of the words in addition to the syntactic relationships between the various parts-of-speech. If a language is to be computer-tractable, parsing must depend **only** on morphosyntax.

Sometimes, periphrasis or parenthetical expressions can be used to eliminate the ambiguity. Here's an example:

        The boy and the girl, both of whom ran away, ...
        Jim, Bob, and Joe, all three of whom were in the accident, ...

In effect, the expressions "both of" and "all three of" terminate the coordinated structure and allow further modification.

However, this option is rarely used even when it is available.

Now, consider the following two sentences, and note how the parentheses indicate how the constituents are grouped based on their most likely interpretations:

        (The boy with the red hat) and (the girl with the puppy)...

        The boy with ((the lunchbox) and (the book with the missing
            cover))...

The two examples seem to be syntactically identical, but a human listener would group the constituents differently. In the interlingua, the adjectival phrase "with a missing cover" modifies the noun "book", and the conjunction "and" links the noun phrases "the lunchbox" and "the book with a missing cover". Thus, the grouping shown in the second example is correct, while the grouping shown in the first example is wrong.

The reason why the first example is not ambiguous in English is because it's the only grouping that makes sense. However, it is possible for the same structure to be ambiguous, as in the following example:

        I just looked at the room with the new computer and the modem
            with the bad ICs.

Is the modem in the same room as the computer? In the interlingua, the answer is "yes", but in English the sentence is ambiguous. Does the computer also have bad ICs? In the interlingua, only the modem has bad ICs, but in English it is not clear.

In English, the sentence is doubly ambiguous, not only because attachment on the right is ambiguous, but also because we're not sure where the coordinated structure begins. Does it begin with "the room" or does it begin with "the new computer"?

Now, the interlingua is not ambiguous - only the modem has bad ICs. Also, in the interlingua, there is no doubt that both the computer and modem are in the same room. How, though, can we indicate that both the computer and the modem have bad ICs or that they are **not** in the same room? Again, periphrasis can sometimes work:

        I just looked at both the room with the new computer and the
            modem with the bad ICs.

However, this option is not always available, and if it is, it's not often used, since either context will resolve the ambiguity or the speaker simply won't realize that there is an ambiguity.

In the interlingua, we will also have the option of using periphrasis. In fact, this may be the only option when translating from a natural language statement that uses periphrasis, because the translation software may not be sophisticated enough to realize what is actually happening.

However, we will also implement a solution that is purely syntactic and which can be used when practical. We will do this by allocating two new particles. The particle "kunmwa" will be the equivalent of an opening parenthesis and the particle "jaymwa" will be the equivalent of a closing parenthesis. Thus, in addition to the default linkages, we can also do the following:

        Kunmwa the boy and the girl jaymwa who ran away... -> both the boy
            and the girl ran away.

        Kunmwa the boy with the red hat jaymwa and the girl with the
            puppy...
            -> the boy with the hat is separate from the girl with the
            puppy.

        I just looked at kunmwa the room with the new computer jaymwa and
            the modem with the bad ICs. -> the modem is not with the
            computer and is probably not even in the same room.

        I just looked at the room with kunmwa the new computer and the modem
            jaymwa with the bad ICs. -> the computer and the modem are in
            the same room and both have bad ICs.

It's important to note that the particles "kunmwa" and "jaymwa" may only be used when the default interpretation is not the desired one. And since most coordinated structures are relatively simple, these particles will probably not be needed very often.

\[Incidentally, some natural languages achieve a bracketing effect similar to that of "kunmwa" and "jaymwa" by using explicit open/close morphemes that are very reminiscent of parentheses. Here's an example from Malagasy:

        ity    trano   fotsy   ity
        this   house   white   this
        'this white house'

There are also many languages, such as Persian (Iran), Yoruba (West Africa), and Hewa (Papua New Guinea), that bracket their relative clauses with explicit start and end morphemes. Although this may seem unnecessary or even redundant, it can be useful at times to prevent ambiguity.\] <span id="S21_4"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 21.4 Parenthetical Expressions

Parenthetical expressions which elaborate or exemplify a concept sometimes use conjunctions, but not always. Here are some examples in English:

        Some people, SUCH AS JOHN, BOB, AND MIKE, had to leave early.
        Many birds do not fly south for the winter (E.G. SPARROWS AND
            PIGEONS).
        The house needed certain repairs, SUCH AS TO THE ROOF AND TO THE
            CHIMNEY.
        The man who managed the finance department, BILL JOHNSON, also
            managed the marketing department.
        The single disadvantage (I.E. THE HIGHER COST) will probably
            kill the project.
        John Smith, WHO JUST FILED FOR BANKRUPTCY, recently moved to
            Texas.

In the interlingua, we will use the following particles to bracket a parenthetical expression:

        camwa    ->     start particle for a parenthetical expression
        bumwa    ->     end particle for an incomplete parenthetical
                        expression (equivalent to "such as" ... "etc")
        jomwa    ->     end particle for a complete parenthetical
                        expression (equivalent to "i.e.")

The start particle will introduce a list of one or more items and an end particle must terminate the list. If a list has more than one item, then they must be separated by the special conjunction "fepye". These words correspond to pauses used in speech, or parentheses and commas used in writing.

The start particle should immediately follow the headword of the constituent that it modifies. For example, in the phrase "the absent employees (i.e., Bill and John)", "camwa" should immediately follow the word for "employee". And since adjectives follow nouns in the interlingua, this will place the parenthetical expression between the words for "employee" and "absent". Thus, syntactically, "camwa" acts something like an open previous-word modifier. <span id="S21_5"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 21.5 Quotes

To handle quotes, we will use the particle "temwa" and will terminate the quote with "jomwa". Any expression that starts with "temwa" will be treated as a noun by the parser. Note that these particles can often be used in the same way that English uses quotes in writing or the words "quote" and "unquote" in speech. Here are some examples:

        I asked Bill temwa Do you have enough money? jomwa
        He shouted the words me temwa Go away! jomwa at the teacher.

Note that the generic linker "po" must be used if the quoted material modifies another noun, as in the second example.

The defaults for definiteness do **not** apply to quoted material. Here are two examples:

        I asked Bill temwa Do you have book? jomwa.
        = I asked Bill "Do you have book?".

        I asked Bill temwa Do you have zepe book? jomwa.
        = I asked Bill "Do you have the book?".

Note that the definite article "zepe" **must** be used even though it would be the default in normal text. <span id="S21_6"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 21.6 Conditional Clauses

When one event is conditional upon another, English normally links the events with an "if...then" construction, as in the following example:

        If the law is passed, (then) tax forms will be simpler.

We can implement conditional clauses by using conjunctions corresponding to the contingency/entailment relationship or by directly using the contingency/entailment verbs.

In the interlingua, we will allocate the true conjunction "jopye" to represent the contingency relationship. And, as we did with "pye" and "gwepye", we will derive the verbal relationships from the conjunctions. Here are the results:

        True Conjunction "jopye" = 'if', 'as long as':
                (Tax forms will be simpler) jopye (the new law passes)
                = Tax forms will be simpler if the new law passes.

        Verb P/F-s "jopyeda":
                (Tax forms are simpler) jopyeda (the new law passes)
                = Having simpler tax forms is contingent upon/depends on
                        passage of the new law.

        Case tag "jopyede" = 'provided/providing (that)', 'on condition
                                (of)', 'as long as', 'if', 'depending
                                on', etc.
                We'll go to the lake jopyede the weather.
                = We'll go to the lake depending on the weather.

        True Conjunction "jopyekwe" = 'then' ("-kwe" = inverse suffix):
                (The new law passes) jopyekwe (tax forms will be simpler)
                = If the new law passes, then tax forms will be simpler.

            [Note that the word "jopye" meaning 'if' cannot be used
            here.  This is similar to Hindi, where the word meaning
            'then' is always required, while the word meaning 'if'
            is optional.  In English, of course, the exact opposite
            is true.]

        Inverse F/P-s "jopyekweda":
                (The new law passes) jopyekweda (simpler tax forms)
                = Passage of the new law implies/entails/means simpler
            tax forms.

The English expression "what if" is a shortcut for "what happens if", which can be rendered as "madiki fisyu" in the interlingua. We can also use interrogative "jopyeki":

        Madiki pu fisyu jopye the new law passes?
        = What will happen if the new law passes?
        = What if the new law passes?

        The new law passes jopyeki?
        = The new law passes then what?
        = What if the new law passes?

Note that we have not implemented an equivalent for the English word "unless", since it's just a shortcut for "...if...not...". For example:

        I won't go unless you go = I won't go if you won't go.

In other words, English "unless" is simply "jopye bume" in the interlingua.

Another kind of conditional expression is called the *counterfactual* expression. Here's an English example:

        If Joe had opened the window, Louise would have screamed.

The implication here is that Joe did **not** open the window and Louise did **not** scream; i.e., that the event is purely hypothetical.

\[Incidentally, do not confuse counterfactual "would" with habitual "would"; e.g., "If I arrived early, he would offer me some coffee". A good test for this is to replace "if" with "when". If the replacement is grammatical and the meaning is essentially the same, then it is **not** a true counterfactual. For example, "When I arrived early, he would offer me some coffee" is habitual, **not** counterfactual. In a true counterfactual, "if" must always be used or implied in English.\]

Counterfactuals are only useful in the past and perhaps the present tense:

        If Sam had arrived earlier, Joe would have been angry.
        If Sam were to arrive now, Joe would be angry.
        *If Sam arrives later, Joe would be angry.

Even if the third example is grammatically acceptable (I find it very awkward), it's still not a true counterfactual because "would" is simply a synonym for "will".

It's also possible to modify the probability of the hypothetical implication by using polarity prefixes, as in the following:

        Maximum:
            If Joe had opened the window, Louise would have screamed.
        High:
            If Joe had opened the window, Louise probably would have
            screamed.
        Minimal:
            If Joe had opened the window, Louise just possibly would have
            screamed.
                OR
            If Joe had opened the window, Louise just might have
            screamed.  [Note that "would" is not used here.  The use of
            "had", however, forces a counterfactual interpretation.]
        Unspecified:
            If Joe had opened the window, Louise would possibly have
            screamed.

In effect, 'counterfactuality' is a combination of 'hypotheticality' and 'probability', and the result is also an epistemic modality. The degree of the modality will determine the degree of probability of the hypothetical implication.

In the interlingua, we will allocate the epistemic modal root "zanme" for counterfactuality.

Two obvious derivations of this modality are "bizanmesodo" meaning 'counterfactual' (i.e., 'both hypothetical and untrue') and "zanmesodo" meaning 'hypothetical' or 'speculative' (i.e., 'hypothetical and possibly true'). <span id="S22_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 22.0 Compounding

Compounds are single words or simple expressions that represent unique concepts, but which are formed by combining two or more root morphemes. There are three kinds of compounds:

        1. Compounds which represent the sum of their components (i.e.,
            both components are present):

            to test-fly = to test AND to fly
                also drop-kick, stir-fry, go swimming/shopping/etc

        2. Compounds in which one root is the argument (core or oblique)
            of the other root:

            watchmaker = X makes watch (argument = object)
                also mousetrap, fly swatter, housecleaning, blood test(er)

                Compounds of this type can also be created using verbs that
                are derived from basic nouns: baby oil (= X 'oils' baby),
                dish towel (= X 'towels' dish), doghouse (= X 'houses' dog),
                towel rack (= X 'racks' towel), dancehall (= X 'halls'
                dance), water skis (= X 'skis' water), snowshoes (= X
                'shoes' snow), etc.

            rescue team = team rescues Y (argument = subject)
                also team rescue, student association, fan club, manmade

                [Note that the grammatical voice of the verb meaning
                'rescue' determines whether the interpretation is 'rescue
                team' or 'team rescue'.]

            college education = X educates Y in/at college (argument =
                            oblique locative)
                also beach party, mountain warfare, barn dance, city
                life

            spring showers = it rains DURING spring
                battle fatigue, evening prayers, marital sex, night
                flight

            to towel dry = X dries Y using towel (argument = oblique
                            instrument)
                also steam iron, to water cool, handwriting, windmill

            to backpedal = X pedals backwards (argument = oblique
                            method/manner)
                also to sidestep, freestanding, to dog-paddle, to
                bunny-hop

            And so on.  Many more oblique relationships are possible.

        3. Compounds in which BOTH roots are core arguments of an IMPLIED
            verb:

            bedsore = bed CAUSES sore
                also disease germ, storm damage, tear gas, birth pain [Note
                that the INVERSE sense of the verb "cause" is used for
                "disease germ" and "tear gas".]

            tax laws = laws BEING FOCUSED ON taxes also murder
                investigation, UFO sighting, food requirements

            houseboat = boat BEING-THE-SAME-AS house
                also dungheap, girl friend, infantry battalion, snowball

                [Note that this group could also be considered as the noun
                equivalent to verb compounds like "stir-fry" mentioned
                above, since both components are present.]

            olive oil = oil BEING A DERIVATIVE OF olives also
                solar energy, buffalo hide, wood pulp, cane sugar also
                inverses meat calf, milk cow, pulp wood

            toolbox = box CONTAINING tools
                also apple pie, pea pod, salt marsh
                also inverses lemon peel, door knob, windowpane

            And so on.  There may be others that fall into this category.
            However, if there are, I doubt there are very many of them.

Note that many compounds can appear in more than one category. For example, "tree nursery" can be derived from "X GROWS trees AT nursery" or the inverse of "trees BEING LOCATED IN nursery". The compound "towel rack" can be derived from "X places towel ON rack" or the inverse of "towel BEING LOCATED ON rack". It is important to keep this in mind, since it's possible that one version may be implemented more efficiently than another, even though they have essentially the same meanings. Also, some are more specific, and thus less useful, than others.

\[Incidentally, Mandarin Chinese has many compounds in which each component means essentially the **same thing**. However, since most Chinese morphemes have several meanings, using just one would be ambiguous. By using two with the same or close meanings, the result is a word whose meaning is the meaning that the two components have in common. In a properly designed language, this type of compound is totally unnecessary.\] <span id="S22_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 22.1 Implementing Compounds

Some languages implement compounds by simply juxtaposing complete words (e.g. English, Chinese, Indonesian, and Quechua). Unfortunately, this approach is useless if you want the resulting compounds to be semantically precise. (By "precise" I mean 'as precise as the inherent precision of the basic components will allow'.) For example, what is the relationship between "house" and "boat" in the word "houseboat"? What is the relationship between "house" and "maid" in the word "housemaid"? Obviously, the relationships are different.

Another way to implement compounds is to use a combination of a headword and a morphologically correct modifier (e.g. English adjective-noun compounds "solar panel", "marital sex", "marine life", "academic transfer", etc.). English uses this approach occasionally, French uses it more often, while Russian and Arabic use it quite often. In general, a language is more likely to use this approach if it has a regular and productive way to convert words from one part-of-speech to another. However, while the semantics of this kind of construction is more precise than simple juxtaposition, it can still be ambiguous.

In many languages, ambiguity is somewhat reduced by using linking morphemes such as English prepositions. Swahili uses this approach for almost all of its compounds, and French uses it for most (French examples: "salle manger", "eau de toilette", "film en couleurs", etc.). English uses it occasionally, as in "son-in-law", "hand-to-hand", and "bed of nails". Note, though, that these linking words can be very vague and their use is often idiosyncratic. If we want the semantics of our compounds to be precise, then the semantics of the linkers must also be precise.

With the above comments in mind, let's look again at each type of compound and ask ourselves the following questions:

        a. Do we already have a way to implement this type of compound?

        b. If not, what new technique should we create to do it?

As I will show below, the answer to question "a" is always "yes", making question "b" unnecessary. Here goes...

**1. Verb-Verb Compounds**

Compounds similar to English "stir-fry" seem to be quite rare among natural languages. The only languages I know of that use them frequently are Chinese and a few others that make extensive use of serial verb constructions.

In the interlingua, we can implement these compounds easily by creating case tags and adverbs that perform the same semantic function as serial verbs.

**2. Open-Word Compounds**

We can often accomplish this in the interlingua by 'opening up' the argument structure of nouns and adjectives derived from verbs. Here are three examples using words we've already created:

        duck teacher = "konlokadaw nucabodi" = 'teacher about ducks', where
            "konloda" = AP-s verb 'to teach', verb "konloka" = AP/F-s 'to
            teach', "cabodi" = 'duck', and "nu-" = generic prefix.

            [Remember, we open up the argument structure of a normally
            'closed' noun by using the part-of-speech suffix "-daw".]

        duck teacher = "konlovyudaw nutabo" = 'teacher of ducks' or 'one who
            teaches ducks', where "konlovyu" = A/P-d verb 'to teach
            (someone)'.

However, do not confuse these with:

        duck teacher = "cabodo koncindi" = 'a teacher who is a duck'

            [Here, there is no need to 'open up' the noun "koncindi" =
            'teacher' to make the subject position available for use.
            Instead, we simply use the adjective version of the noun meaning
            'duck'.]

Finally, many compounds are really not necessary. For example, the English word "backpedal" can be just as easily implemented as "to pedal backwards", where "backwards" is a basic adverb.

**3. More Complex Compounds**

Some compounds will require that two concepts be the arguments of another verbal concept. Here is another one where the implied verb is "zizada" = 'to be':

        snow duck = "bavindo cabodi" = 'duck which is snow' (cf. "snowman",
                                                    "snowball", etc.)
            where "bavindi" = 'snow'

Note that all of the above are just adjective-noun compounds, where the basic relationship is not stated separately, but is the result of normal derivational rules. The interlingua can create many compounds this way, as is commonly done in languages such as French, Russian, and Arabic, but with true semantic precision.

Now, let's create some compounds in which the relationship must be indicated by a separate word. Here are two examples:

        silver mine = mine XXX silver = 'mine being-the-source-of
            silver' where "XXX" is the open adjective inverse of the
            paronymy relationship that we discussed earlier.

        hydrology textbook = textbook XXX hydrology = 'textbook that
            contains hydrology' where "XXX" is the open adjective inverse of
            the constituency relationship that we discussed earlier.

And so on. These compounds are similar to Swahili compounds and most French compounds, but are semantically precise. English often creates similar constructions, such as "blood-sucking mosquitos", "swamp-dwelling amphibians", "man-eating tigers", "house-cleaning lady", etc. In these, however, only the hyphenated part of the construction is usually classified as a compound.

Thus, since **any** relationship can be expressed by a transitive verb, and since **any** transitive verb can be converted to an open adjective, there is no limit on the number of compounds that can be created with semantic precision.

We can create vaguer noun-noun compounds by using "tudu", which we discussed [earlier](#about). For example, "hydrology textbook" could be implemented as simply "textbook tudu hydrology". In fact, this approach is just as semantically vague as compounding in most natural languages, and can be used for **any** noun-noun compound.

Finally, the approach we are using here allows us to create many useful compounds that, in a language like English, would be either ambiguous or even impossible to create. For example, the English compound "woman teacher" could mean 'woman who teaches', 'teacher of women', 'teacher who focuses on women', 'one who teaches like a woman', etc. With the system presented here, we can create more compounds, and their meanings are always obvious. This ability is especially important because an MT interlingua is likely to be used by people who have different native languages. For example, if we were to create compounds as in English (by the simple juxtaposition of two root morphemes) the results will often be gibberish for some or will be interpreted differently by people of different linguistic backgrounds.

Unfortunately, in all natural languages, most compounds are created as needed and do not appear in dictionaries. Machine translation software that attempts to translate these compounds from a natural language to the interlingua will generally not be able to provide a precise translation, but will instead be forced to provide a vaguer substitute. However, human translators should always provide precise compounds to ensure that subsequent translations into other natural languages are as accurate as possible. <span id="S22_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 22.2 Compounds from Other Derivational Morphemes

As we've already seen, derivation of basic nouns is actually very similar to compounding. For example, when we derived nouns from the semi-root meaning 'liquid', we paraphrased them using expressions such as "water bug" and "water energy". In fact, because of the nature of the classificational system we are using here, all roots are pseudo-compounds in which the classifier plays the role of a semantically precise head morpheme, while the semi-root provides only a mnemonic clue.

Prefixes and suffixes can also be used to create words that, in other languages, are often implemented as compounds. We've already seen many of these. Here are some examples:

        xebatondi  -> snowstorm ('high' scalar semi-root "xe-")
        zubatondi  -> snow flurries ('minimal' scalar semi-root "zu-")
        lakonmendi -> high/secondary/middle school ('average/middle' scalar
                            semi-root "la-")
        nekonlodi  -> teaching ability (quality/ability prefix "ne-")

In summary, there is no need to add any new morpholexical features to the interlingua to handle compounds. Any compound that is needed can be easily created with whatever degree of precision is needed using the existing derivational techniques. <span id="S22_3"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 22.3 Mnemonic Derivations

Some compounds are not semantically precise, but actually refer to a subset of entities within a class. In other words, a literal interpretation of the compound actually describes more entities than it is intended to represent. For example, we might be tempted to create the adjective+noun compound with the literal meaning 'black bear' to represent the species 'Black Bear'. However, this would be incorrect, since 'black bear' can apply to any bears that are black in color, even those that are not members of the species 'Black Bear'. Because of this, a normal compound cannot be used.

What we need is a way to make a distinction between normal, semantically precise phrases and mnemonic compounds.

In the interlingua, we will accomplish this by using the prefix "nen-" for derivations that refer to distinct concepts that are over-described by normal derivation. This prefix will be used on the **modifier** or **argument** of a headword of a normally formed compound. For example, if the word for 'bear' is "bijudi", and the word for 'black' is "bubyedo", then the expression "bubyedo bijudi" can be applied to any bear that is black in color, while the mnemonic compound "Nenbubyedo Bijudi" will refer only to members of the species 'Black Bear'. Note that the prefix is applied to the modifier, since it is being used for its mnemonic value.

With this approach, we are providing ourselves with the ability to use normal compounding techniques where we feel that a simple basic noun is inappropriate.

\[Later, I will discuss a consistent and objective approach for [naming species](#S25_1).\] <span id="S23_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 23.0 Topicalization

We've already discussed some of the ways in which an argument of a verb can be 'topicalized' or made more salient than other arguments. In this section, I will discuss and summarize all of the various degrees of topicalization that an MT interlingua will need.

Topical constructions add emphasis and sometimes contrast over and above the normal topicalization indicated by argument structure. In natural language, there are basically four degrees of topicalization:

        1. Normal topicalization.  Topicalization is indicated by the
        basic argument structure of the verb; i.e. a subject is more
        topical than an object or an oblique argument.  In some
        languages, especially those with an anti-passive construction,
        objects may be more topical than oblique arguments.  (English
        does not seem to make a distinction in topicality between
        objects and obliques.  This view is supported by the fact that
        so many English verbs are inherently anti-passive but do not
        have active counterparts with clear differences in topicality;
        e.g. "to listen to", "to talk to", "to look at/for/up", "to
        wink/shout/laugh at", "to complain to", etc.)

        2. Contrasting topicalization.  Topicalization provides both
        emphasis and contrast.  Here are some English examples:

            It's John who killed the chicken
              OR  JOHN killed the chicken.
            It's a chicken that John killed
              OR  John killed a CHICKEN
              OR  A chicken is what John killed
              OR  What John killed is a chicken.

        3. Heavy topicalization.  An argument of the verb is made more
        topical than the subject.  Here are some English examples:

            Bill, I saw him yesterday.
            The new amusement park, it opens for business today.
            On Sunday, I plan to relax all day.
            With his new suit, he can attend the conference without
                embarrassment.

        4. Reference-switching.  A new entity is introduced into the
        conversation and singled out for special attention.  Here are
        some examples:

            As for the chair, John broke it.
            As regards John, he left in disgust.
            As far as the meeting is concerned, I decided not to
                attend.
            The thing about John is that he's never on time.
            With regard to the delays, I assure you they won't
                happen again.

Normal topicalization is an inherent part of the verbal derivational system that we are discussing in this monograph. This system is not only perfectly regular, but it allows us to create four sub-degrees of topicality (subject vs. object vs. expressable oblique vs. inexpressible oblique). And, if the syntax is designed properly, then even normally oblique case roles can be promoted relative to the core roles. In contrast, most languages provide only two or three sub-degrees, while typically displaying a considerable amount of idiosyncracy.

The second kind of topicalization, contrasting topicalization, is used to add both emphasis and contrast to an argument of a verb. English is somewhat unusual among the world's languages in implementing this function using cleft sentences. Most languages achieve this function by somehow marking the item with an inflection or particle and leaving the item in its normal position in the sentence. However, I believe that most (if not all) languages can achieve the same effect by simply giving the word additional stress.

In the interlingua, we will achieve this effect with the special particle "bawmwa", and its part-of-speech will be previous-word modifier. Thus, it should immediately follow the word that is being emphasized.

        John killed a chicken bawmwa.
        = A chicken is what John killed.
        OR
        = What John killed is a chicken.
        OR
        = John killed a CHICKEN.

        Billy hit Jimmy bawmwa?
        = Was it Jimmy that Billy hit?
        OR
        = Billy hit JIMMY?

        Louise may bawmwa have bought a lamp.
        = It MAY be a lamp that Louise bought.
            OR
        = Louise MAY have bought a lamp.

And so on.

The third type of topicalization, heavy topicalization, focuses the listener's attention on a particular argument of the verb. In effect, it makes the argument even more topical than a normal subject. Most natural languages, including English, accomplish heavy topicalization by a process called *left dislocation*; i.e. by moving the emphasized argument out of the sentence and placing it before the sentence. In addition, an anaphor of the moved item normally appears in the original position in the sentence if the moved item is a core argument of the verb. Thus, in English:

        The Smiths, THEY left early.

Here, "the Smiths" is left-dislocated and the anaphor "they" takes its place in the sentence. In addition to the dislocation, languages mark the emphasized item either by an explicit marker, such as a particle, by a change in stress and timing, or both.

Left-dislocation seems to be the way that most natural languages implement heavy topicalization. Also, in most (if not all) languages, an anaphor of the dislocated item occupies the original position in the sentence if the dislocated item is a core argument. We will use the same approach in the interlingua.

In the interlingua, we will reserve the particle "bonmwa" for this purpose. Here are some examples:

        Bonmwa cabodi, the sailors ate cahi.
        = The duck, the sailors ate it.

        Bonmwa on Sunday, I plan to relax all day.
        = On Sunday, I plan to relax all day.

However, "bonmwa" is really not necessary if the topicalized argument is oblique. In this case, we can simply place the oblique argument ahead of the subject, as we discussed [earlier](#S2_7_3). For example, assuming a right-branching syntax, the sentence "Went on Monday Joan to the movies" would be translated "On Monday, Joan went to the movies".

The fourth kind of topicalization, reference-switching, introduces or re-introduces an entity into the conversation, and singles it out for special attention. This is also normally implemented as a type of left-dislocation, since the argument is moved to the left of the sentence and the gap in the main sentence is almost always filled with an anaphor of the moved argument. In English, this is usually accomplished with phrases such as "As for X, ...", "With regards to X, ...", "As far as X is concerned, ...", "The thing about X is that ...", etc. In the interlingua, we will use the particle "xwamwa" for this purpose:

        Xwamwa John, I think the boss is going to fire him.
        = As far as John is concerned, I think the boss is going
             to fire him.

        Xwamwa the new employee, I think he'll do very well.
        = As for the new employee, I think he'll do very well.

Note that both "bonmwa" and "xwamwa" require that a complete sentence immediately follow their argument. <span id="S24_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 24.0 Proper Names, Borrowed Words, Abbreviations, and Vocatives

Proper names are the names of individual people, places, and things. However, what is considered "proper" can differ from language to language. Here is the precise definition that we will use for the interlingua:

        A proper name is a word that is INTENDED to refer to a
        specific, unique representative of a more general category
        designated by a basic noun.  The proper noun word itself
        cannot have sub-categories.

Thus, using the above definition, words such as "Atlantic", "Johnson", "IBM", "Christianity", "New York", "Caucasian", "1996", and "USA" are all proper nouns. They are intended to represent unique instances of, respectively, the following common nouns: "ocean", "person", "religion", "city", "race", "corporation", "year", and "nation".

With the above definition, it would appear that a word such as "Christian" cannot be a proper name because it has sub-categories such as "Catholic" and "Methodist". However, "Catholic" and "Methodist" are NOT true sub-categories of the word "Christian", they are sub-categories of the word "sect".

Names of people, such as "Mike Johnson", often refer to more than one person. However, they are still proper names because they are **intended** to isolate a particular individual.

Common nouns such as "tiger", "catfish", and "professor" cannot be proper names because they are generic terms that are not **intended** to isolate specific entities. If we wish to isolate a specific entity, then we must qualify the common noun, as in "this catfish" or "the new professor".

Names of specific activities, such as "soccer" (a specific sport), "opera" (a specific musical form), and "geology" (a specific field of study) are not proper names because they must either be qualified to isolate a specific instance (e.g. "yesterday's soccer match") or must be titled (e.g. the opera "Carmen").

A proper name such as "1996" represents a specific period of time, and in the semantics of the interlingua, time is considered an entity (it is classified along with all of the other physical nouns). Also, words such as "March" and "Tuesday" are also proper names, even though they can refer to more than one period of time, because they are **intended** to isolate a particular time period. <span id="S24_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 24.1 Implementing Proper Names

In the interlingua, the prefix "na-" will be used to create proper names, and the normal rules of self-segregation must be applied. However, the root classifier must be appropriate for the proper noun. Other prefixes and semi-roots that follow "na-" will **not** have semantic significance, but they may be used for their mnemonic value.

Here are some examples:

        Africa
            - Nafrifedi ("-fe" = appropriate class for 'continent')
            [Consonants such as 'r' are not used in normal word design, but
            may be used in proper names.  Unusual consonant clusters, such
            as "fr" are also allowed in proper name roots.]

        France
            - Nafranxindi ("-xin" = appropriate class for 'nation')

        The River Nile
            - Nanilacudi ("-cu" = appropriate class for 'river')
            [Note that "The" is required in the English translation, even
            though the definite article is not normally used with proper
            names.]

        John
            - Najoncedi ("-ce" = appropriate class for 'person')

The 'person' classifier "-ce" should be used for all sentient beings as well as for animals that are normally given individual names, such as pets.

The normal rules of derivation that apply to basic nouns will also apply to proper nouns. For example, the P-s verb "Nafranxinda" means 'to be France'.

For the attributive adjective associated with a proper name, we must use the quality prefix "ne-". For example, "Nenafranxindo woman" means 'French woman' and "Nenafranxindo food" means "French food".

Conventions can also be adopted that apply to proper names that come in groups. For example, days of the week can all have the form "NaXXxekundi", where the sub-string XX is a numeric CV, "xe" is the semi-root of the measure noun "xezidi" meaning 'day', and "-kun" is the appropriate 'time' classifier:

        Nacaxekundi - Monday       ("ca-" = numeric 'one')
        Nafexekundi - Tuesday      ("fe-" = numeric 'two')
        Nagixekundi - Wednesday    ("gi-" = numeric 'three')

And so on. Conventions can also be adopted for months of the year, the years themselves (e.g. "1996"), letters of the alphabet, stellar constellations, etc.

A proper noun can be modified by adjectives to indicate titles. Here's an example:

        cakoncindi              - 'professor'
        Najonzocedi             - 'Johnson'
        cakoncindo Najonzocedi  - 'Professor Johnson'

Note that the above literally means 'Johnson who is a professor' or simply 'Johnson the professor'. Note also that we could not use "Najonsocedi" because "so" is a suffix and would terminate the word prematurely.

If an entire translatable expression is a proper name and it does not have a dictionary entry, such as a book or report title, or the complex names of not-very-well-known places or events, then it should be bracketed by the proper name particle "namwa" and the parenthetical stop particle "jomwa". We can use these to create proper names such as "The White House", "The Sea of Japan", "The American Revolutionary War", and so on. Expressions bracketed by "namwa ... jomwa" are always nouns but cannot undergo further derivation. Also, the defaults for definiteness do **not** apply within proper expressions. Thus, the definite article "zepe" must be used even if it is normally the default. <span id="S24_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 24.2 Borrowed Words and Abbreviations

It will not be practical to have equivalents in the interlingua for all proper names of all natural languages. In general, we will only provide equivalents for names that are truly international, such as country names and the names of well-known cities, monuments, etc. Because of this, all translation software must be able to accept natural language names.

We will accomplish this by enclosing the names in curly brackets, preceding them with any necessary prefixes (especially gender prefixes, if applicable), and appending an appropriate classifier. Additional suffixes (such as a required part-of-speech suffix) can appear after the classifier. Here are some examples:

        Nawna{Mahatma Gandhi}cedi = "Mahatma Gandhi" ("naw-" = male prefix)
        Na{IBM}bindi = "IBM" ("-bin" = classifier for a business)
        Na{Flash Gordon}jadi ("-ja" = classifier for a book or movie)

Note that all of the above use the prefix "Na-" since they are all proper names.

We will also extend this to apply to non-proper words that are not likely to have equivalents in other languages. For example, we can have legitimate words such as {sushi}fudi = "sushi" and {pici}sondi = Indonesian man's hat.

Note that an appropriate classifier is **mandatory**, even for proper names, because it provides valuable information that can be used by the translation software to improve the result.

This technique can also be used to quote parts of words, complete words, abbreviations, words in other languages, or even longer strings that cannot be translated. For example, we could discuss the P-s suffix "-sya" by referring to it as {P-s "-sya"}xidi, where "-xi" is the classifier for components of a performance.

A problem arises when we need to create an anaphor of a borrowed word, because an anaphor is formed from the first syllable of the root, and the root of a borrowed word may not conform with the rules of the interlingua. We will deal with this problem by adopting the following rule:

        The anaphor of a borrowed word will always use the mandatory
        classifier.

<span id="S24_3"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 24.3 Vocatives

A vocative is a word or phrase intended to directly address or get a person's attention. In the interlingua, vocatives are implemented with the special part-of-speech suffix "-dya" which must be applied to the head noun of the vocative noun phrase.

The true generic "Madya" can be used as a general way to get someone's attention, and is equivalent to English "Say there!", "Hey!", or even "Ahoy!". Thus, it is, in effect, a stand-alone sentence. We can also consider it to be a disjunct for whatever sentence that follows it.

Syntactically, all other vocatives are nouns because they can take modifiers and arguments. For example, they can be modified by adjectives, and, if they are open, they can have arguments. However, from the clause's point-of-view, they are oblique arguments, and can appear in any part of the clause suitable for an oblique argument.

Here are some examples (assume VSO word order):

        Madya!  Meki      mesa femi joydi?
                interrog  have you  boat
        = Say there!  Do you have the boat?

        Mesa Cakoncindya    mi joydi.
        Have Professor(voc) I  boat
        = Professor, I have the boat.

        Moykudoy   may Najoncedya!
        Leave(imp) now John(voc)
        = Leave now, John!

Note that, if a vocative is the first argument of the verb (as in the second example), it has even more salience than the subject. Thus, it must be fronted in the English translation. <span id="S25_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 25.0 Choosing Primitives: Vocabulary Design Strategy

In this chapter, I would like to discuss some of the strategies used to design the vocabulary of the interlingua.

Very early in this monograph, we decomposed the verb meaning 'to know' into a root concept and an argument structure. We then applied all other possible argument structures to the same root. This process resulted in many unexpected and extremely useful derivations. The number of useful derivations increased even more as we applied prefixes and other suffixes.

With the above in mind, we can state several general guidelines for word design:

        1. Start with simple, common verbs and adjectives.  Isolate their
        root concepts and apply it to every classifier.  Appropriate suffixes
        should be used when related verbs have different argument structures
        (e.g. "to say" vs. "to tell").  In the process, a very large number
        of less common concepts will be automatically derived.  This
        principle also applies to numeric, deictic, tense-aspect, and modal
        concepts.

        2. Keep in mind the inherent difference between basic state concepts
        and modal concepts.  When in doubt, always test new concepts to
        determine if they are modal.

        3. If there's difficulty defining a basic state or modality, or if
        it has limited usefulness when combined with most classifiers, it is
        very likely that the state is not very basic.  When this occurs,
        postpone derivation until later.  You may be able to "accidentally"
        derive it from a different root.

        4. Always be suspicious of roots that represent energetic states.
        Many of these concepts can actually be derived from non-energetic
        states that end up being much more productive.

The fourth principle is the most difficult to apply, since the nature of the more basic state may not be obvious. In a situation like this, postpone derivation of the particular verb. There's a good chance that the desired word will be derivable from a different root concept that you haven't yet defined.

Another tactic is to examine words that have similar meanings (a thesaurus can be very useful for this), or to create a few paraphrases of a sentence that uses the word. For example, how do we deal with the verb "to establish"?

        He established his innocence.
        He proved his innocence.
        He convinced others of his innocence.

where

        "He" = agent
        "others" = patient
        "his innocence" = focus

Thus, "to establish" is simply the A/F-d \[-P\] (i.e. anti-middle) derivation of the A/P/F-d verb meaning 'to convince (of/that)'. And, as we saw earlier, the verb meaning 'to convince' is "bilimevu" and is derived from the evidentiality modality. Thus, this sense of the English word meaning 'to establish' is simply "bilimevusoy". Similarly, the anti-passive derivation "bilimevuvoy" is also useful, and is equivalent to the English verb "to prove", since it can take an oblique patient.

Incidentally, by now it shouldn't be too surprising that obscure grammatical voice operations such as middle, anti-passive, and inverse can produce so many useful words. Languages that do not have these voice operations must instead use unique root morphemes, periphrasis, metaphors, or even idioms. Because of this, it is important to constantly keep these 'obscure' derivations in mind, especially when you run into difficulties. There are many hidden and pleasant surprises in such a powerful derivational system as the one presented here. <span id="S25_1"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 25.1 Single Words or Compounds?

When designing our vocabulary, we will often have to ask ourselves whether a concept should be implemented as a single word or as a compound. Natural languages differ considerably in this respect. For example, English has unique unrelated words meaning 'mouse' and 'rat', while Japanese does not. On the other hand, Swahili has unique, unrelated words for 'soldier ant', 'white ant', and 'brown ant', whereas English forms compounds.

Obviously, a word designer will be heavily influenced by his native language, and may unintentionally copy it. In order to avoid this inherent kind of bias, we need to employ a consistent approach.

In the interlingua, we will adopt the following approach for the design of words to represent **living** entities:

        For the living noun classes, a single word should be created for
        each biological category (phylum, order, class, family, or genus)
        that is linguistically useful; i.e., which is likely to have a
        single-word representation in a natural language.  A single word may
        also be used to represent a super-category consisting of more than
        one category, if the categories are similar enough, and if a natural
        language is unlikely to differentiate between them.  For sub-
        categories (such as individual species) within a category or super-
        category, a descriptive mnemonic compound should be created.  For
        extremely common sub-categories, a unique common noun can be created
        as well.

To illustrate this approach, consider the following chart:

        Common name          Family       Genus & species
        ----------------------------------------------------------
        Arctic fox           Canidae      Alorex lagopus
        Bat-eared fox        Canidae      Otocyon megalotis
        Bushdog              Canidae      Speothos venaticus
        Cape hunting dog     Canidae      Lycaon pictus
        Coyote               Canidae      Canis latrans
        Crab-eating fox      Canidae      Cerdocyon thous
        Dingo                Canidae      Canis familiaris dingo
        Dog                  Canidae      Canis familiaris
        Grey or Timber wolf  Canidae      Canis lupis
        Raccoon dog          Canidae      Nyctereutes procyonoides
        Red fox              Canidae      Vulpes vulpes

As you can see, there is very little consistency in the English names.

Using the above guidelines, we will allocate a single word for all members of family Canidae. In the interlingua, we will allocate the root "canjudi", where "-ju" is the classifier for all mammalian carnivores (Order Carnivora). Thus, the simple noun "canjudi" will refer to any canine, such as 'dog', 'fox', or 'wolf', and the adjective "canjudo" will be equivalent to the English adjective meaning 'canine'. Now, if the proper noun for 'Arctic' is "Nartifedi", we can create the mnemonic compound "Nenartifedo Canjudi" for 'Arctic fox', where "nen-" is the mnemonic name prefix. If the color word meaning 'gray' is 'bubabyedo', then the compound "Nenbubabyedo Canjudi" will mean 'Gray Wolf'. (Note that this is the same approach we used [earlier](#S22_3) to derive the mnemonic compound meaning 'Black Bear'.)

For Canis familiaris, we need to allocate a unique common noun. In the interlingua, we will allocate the simple root "ju". In other words, the stand-alone word "judi" will mean 'dog'. The scientific name can be derived as a mnemonic compound using the word that means 'familiar' or 'common'.

For the non-living noun classes, we will use the following approach:

        1. If a combination of a semi-root plus a noun classifier is highly
        suggestive or mnemonic, then use it.

        2. Otherwise, if a concept can be implemented, without ambiguity, by
        exactly two simpler words, then use the two-word compound, even if
        the result is slightly too general.

        3. However, if a concept requires more than one word to prevent
        ambiguity, then a single word should be created to represent the
        concept.

By allowing compounds that are slightly more general in meaning than their English counterparts, the results are more likely to encompass the meanings of equivalent words in other natural languages. <span id="S25_2"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 25.2 Exchange Verbs

Very early in this monograph, we discussed the semantics of [exchange verbs](#transfer_verbs), such as buy/sell, swap or exchange, and borrow/lend. For these verbs, we will allocate the binary relational 'exchange' classifier "-fay" (default = AP/F-d verb). Here are some examples ("bin" is a modifying semi-root with the senses 'commerce', 'money', 'finance', etc.):

        binfayda   =  AP/F-d verb 'to buy'

        bubinfayda =  AP/F-d verb 'to sell'

In both cases, we will use the 0/AP case tag "make" for the secondary agent-patient. When used with "binfayda" = 'buy', it will be equivalent to English "from". When used with "bubinfayda" = 'sell', it will be equivalent to English "to". We will also use the 0/F case tag "maswa" for the amount paid; i.e., the secondary focus, and in both cases, it will be equivalent to English "for", as in "I bought/sold the boat for 200 dollars". Finally, since the patient of "binfayda" is the person who achieves custody of the focus, the A/P/F-d form "binfayvu" means 'to buy F for P' or simply 'to buy P F', as in "I bought the children a puppy".

Now, while we're at it, we can also use the semi-root "bin" to create the word "binjadi" for 'money/funds/capital' ("-ja" = social artificial other classifier). We can also create "fobinjadi" for 'coin' ("fo- = low scalar polarity semi-root) and "xebinjadi" for 'bill' or 'banknote' ("xe- = high scalar polarity semi-root). <span id="S25_3"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 25.3 Groups of Related Concepts - Color Terms

Many concepts come in groups of closely related members, and we can considerably ease the learning burden by providing regular paradigms to "derive" the corresponding roots or words. We've already seen examples of this when we "derived" deictic roots, tense-aspect roots, numbers, and words for days of the week. Regular paradigms also tend to be inherently neutral. Without them, a language designer is likely to duplicate words and senses directly from his native language, not realizing that other natural languages divide up the same semantic space differently.

Paradigms can be developed for any concept groups that are sequential (e.g. names of months of the year) or componential (e.g. tense-aspect roots). As another example, here is the componential paradigm we will use in the interlingua to represent color concepts:

          Color Components
        --------------------
        black           bu-
        purple          gi-
        blue            taw-
        green           don-
        yellow          jin-
        orange          le-
        red             xu-
        white           ba-

      Shades:
        normal          (default)
        deep            xe-
        pale            fo-

Simple colors are formed from a single color component plus "-bye". For example, "bubyedo" = 'black', "donbyedo" = 'green", "xedonbyedo" = 'deep green', "fojinbyedo" = 'pale yellow', and so on. If two primary colors are combined, the rightmost component will indicate the major color. For example, "bubabyedo" = 'black white' = 'gray'. Here are some more examples:

        white           babyedo
        orange          lebyedo
        yellow          jinbyedo
        purple          gibyedo
        brown           lebubyedo = orange black
        pink            xubabyedo = red white
        magenta         tawxubyedo = blue red
        turquoise       fodontawbyedo = light greenish-blue

All color roots will be P-s adjectives by default.

We can also use "bye" as a stand-alone root with the meaning 'colored' or 'having color'. With this root, we can create words such as the A/P-d verb "byevyu" = 'to color' and the quality noun "nubyedi" = 'color' or 'hue'. Note, though, that we cannot create the word meaning 'colorful' with the classifier "bye" since "colorful' is actually a scalar state. However, we can use "bye" as a modifying semi-root. Thus, "byefido" means 'colorful' and "byezando" means 'colorless/hueless/washed-out'.

Further derivation of specific colors is also possible. For example, P-d "jinbyesyu" would be the verb 'to yellow' in a sentence like "The wallpaper yellowed over time". <span id="S25_4"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 25.4 Groups of Related Concepts - Kinship Terms

By nature, kinship terms are binary relationships. In the interlingua, we will allocate semi-roots that can be combined to create whatever degree of consanguinity is needed. The classifier "kin" will be used to mark kinship relationships, and it will be a P/F-s noun by default.

Here are the kinship morphemes for the ancestor generation:

        ja - parent (either sex)
        ji - female parent
        ju - male parent

Here are some examples:

        jakindi - English "parent"
        jikindi - English "mother"
        jukindi - English "father"
        jajikindi - English "grandmother" (a parent's female parent)
        jajakindi - English "grandparent" (a parent's parent)
        jajajukindi - English "great grandfather" (a grandparent's father)
        jujukindi - Seri "hipaz" (parallel grandfather = father's father)
        jujikindi - Seri "himaz" (cross grandmother = father's mother)

        [Seri is a Hokan language spoken in Sonora state, Mexico.]

Note that, like prefixes, a kinship morpheme modifies everything to its right, and the rightmost semi-root is the head morph. Thus, "jajikindi" = "parent's mother" = 'grandmother'. The word "jijakindi", however, is "mother's parent" = 'maternal grandparent'.

Here are the morphemes for siblings:

        za - sibling (either sex)
        zi - female sibling
        zu - male sibling
        bi - sibling of the same sex
        bu - sibling of the opposite sex

Here are some examples:

        zakindi - English "sibling"
        zikindi - English "sister"
        jazukindi - English "uncle" (a parent's male sibling)

        [We'll see examples using "bi" and "bu" below.]

Here are the kinship morphemes for the descendent generation:

        ga - child (either sex)
        gi - female child
        gu - male child

Here are some examples:

        gakindi - English "child"
        gukindi - English "son"
        gagikindi - English "granddaughter" (a child's female child)
        zagukindi - English "nephew" (a sibling's male child)
        jazagakindi baxanapu - English "cousin" (child of the sibling of a parent)

To handle ancestors and descendents, we will use the following:

        pan - ancestor of (the parent and everyone above on the tree)
        pun - descendent of (the child and everyone below on the tree)
        de - ancestor of (the parent and everyone above on the tree)
        do - descendent of (the child and everyone below on the tree)

Here are some examples:

        pankindi = ancestor
            = parent or grandparent or great grandparent etc.
        jipankindi = mother's ancestor
            = her parent or her grandparent or her great grandparent etc.
        punkindi = descendent
            = child or grandchild or great grandchild etc.
        gupunkindi = son's descendent
            = his child or his grandchild or his great grandchild etc.

We will also need morphemes to indicate marriage relationships:

        ta - spouse (either sex)
        ti - female spouse
        tu - male spouse

Here are some examples:

        takindi - English "spouse/mate"
        tukindi - English "husband"
        tajakindi - English "in-law" (spouse's parent)
        tajikindi - English "mother-in-law" (spouse's female parent)
        zatukindi - English "brother-in-law" (sibling's male spouse)
        jitukindi - English "stepfather" (mother's male spouse)
        tagukindi - English "stepson" (spouse's son)
        jatagikindi - English "stepsister" (parent's spouse's daughter)
        jagikindi - English "half sister" (parent's daughter)

Note in the last four examples that we are using spouse and parent prefixes to indicate step and half relations. We are, in effect, adopting the convention that the simpler terms (e.g. "jukindi" = 'father', "zikindi" = 'sister') will indicate natural relationships, while the more complex terms (e.g. "jitukindi" = 'stepfather', "jagikindi" = 'half sister') will indicate "step" or "half" relationships. With this approach, there is no need to allocate separate morphemes for "step" and "half" relationships.

Here are some useful modifiers:

        xe - modifier meaning 'older'
        fo - modifier meaning 'younger'
        le - referent/focus is female
        lo - referent/focus is male
        cewe - modifier meaning 'adopted'

And here are some examples:

        cewegukindi - adopted son
        xebikindi - Hawaiian "kaikua'ana" (older sibling of the same sex)
        fozakindi - Hawaiian "pooki'i" (younger sibling)
        lexezukindi - Korean "oppa" (a female's older brother)
        lotajikindi - Korean "caangmo" (a male's mother-in-law)
        logukindi - Seri "hisac" (a male's son)
        logugakindi - Seri "hiqupaz" (a male's parallel grandchild = son's child)
        lofozikindi - Seri "hicome" (a male's younger sister)
        lexezigakindi - Seri "hipxaz" (a female's elder sister's child)
        letajikindi - Seri "hiqumez" (a female's mother-in-law)
        lezutikindi - Seri "hicaac" (a female's brother's wife)

Note that, when translating from the interlingua into English, "xe-" and "fo-" can be ignored because English does not make these distinctions. They are needed only for translating to languages that have equivalent words.

The most basic P/F-s verb form, "kinda", will have the general meaning 'have a kinship relationship with', 'be a kin of', 'be related to', etc. The simple noun "kindi" means 'relative', the group derivation "bekindi" is equivalent to the English word "family" or "kinfolk" ("be-" = group semi-root), and "zubekindi" means 'immediate family' or 'household' ("zu-" = minimal polarity semi-root). <span id="S25_5"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 25.5 Telling Time

To indicate the time-of-day in the interlingua, simply use one or more numeric semi-roots with the point-time classifier "-jay". Here are some examples:

        lujayde = 5:00 or 5 o'clock
        cajojayde = 14:00 or 2 PM
        cajayde = 1:00 or 1 AM
        ba-gizejayde = 6:37 = 37 minutes past 6 o'clock
        ba-gize-febujayde = 6:37:20 = 37 minutes and 20 seconds past 6
                                    o'clock
        ba-gize-febu-loy-xoticajayde = 6:37:20.981 = 37 minutes and 20.981
                                    seconds past 6 o'clock

The adverbial forms (part-of-speech suffix "-de") are probably the most useful. For example, "lujayde" literally means 'being 5 o'clock', or simply 'at 5 o'clock'.

Note that this approach implies that any "-jay" derivation that starts with a numeric semi-root must be a time-of-day root. Thus, non-time-of-day roots that use the classifier "-jay" must not start with a numeric semi-root, but may contain one or more of them after the first one. <span id="S25_6"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

### 25.6 Spellings

There will often be times when a word must be spelled out. In the interlingua, all spellings start with the particle "gwemwa" and will be terminated by the particle "jomwa". Letters, digits, punctuation marks, and other symbols will appear between the particles.

Consonants are CV, where V is 'e' for voiced consonants and 'o' for unvoiced consonants:

      b = be      n = ne
      c = co      p = po
      d = de      q = qe
      f = fo      r = re
      g = ge      s = so
      h = ho      t = to
      j = je      v = ve
      k = ko      x = xo
      l = le      z = ze
      m = me

Vowels are as follows:

      a = kwa
      e = kwe
      i = kwi
      o = kyo
      u = kyu

An upper case letter is preceded by "bi":

      B = bibe
      H = biho
      I = bikwi
      T = bito
      etc.

Semi-vowels use "swe" for 'w' and "syo" for 'y':

      w = swe
      Y = bisyo
      etc.

Number symbols will consist of "mu" FOLLOWED by the numeric semi-root for the digit:

      0 = mubu
      1 = muca
      2 = mufe
      9 = muxo
      . = mude (= decimal point OR period)
      - = muxay (= minus sign OR hyphen)
      etc.

Punctuation and special symbols will also have dedicated C(S)Vs:

      question mark = ki
      space/blank = ma
      single quote = te
      double quote = bite
      etc (TBD).

Accented letters use "cay" plus a special C(S)V **after** the letter. The special C(S)V will, if possible, be the same as the punctuation symbol that most closely resembles the accent mark:

      acute accent = cayte
      umlaut = cayfe
      circumflex = cayki
      tilde accent = cayci
      macron = cayxay
      etc (TBD).

       = kwacayte
       = necayci
       = kyucayfe
       = bikyucayfe
      etc.

For stand-alone accents, use the space/blank character "ma" as a placeholder. For example, acute accent (stand-alone) = "macayte".

Here's an example of a complete, spelled-out word:

      "Nasendi?" = gwemwa ne kwa so kwe ne de kwi ki jomwa

Non-Roman alphabets and syllabaries can use the closest equivalent of the above with an appropriate modifier. For example, Greek "kappa" will be "gwemwa ko jomwa xxx", where "xxx" is the Nasendi adjective meaning 'Greek'. Syllabic scripts, such as Japanese Hiragana and Katakana, can use two or more semi-roots. For example, Hiragana "ba" will be "gwemwa be kwa jomwa xxx", where "xxx" is the Nasendi adjective meaning 'Hiragana'. (Obviously, the modifying adjective "xxx" will not be needed if the context makes it unnecessary.)

Chinese characters will be based on their Unicode descriptions, as follows (TBD). <span id="S26_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 26.0 A Sample Derivation

Just for fun, here's a fairly large (but incomplete) set of derivations using the simplest speech act root "te", meaning 'say/tell/speak' (default = A/P/F-d verb). Here goes...

      teda          to tell (e.g. I told John a joke.)
      tesoy         to say, utter ("-soy" = anti-middle; e.g. I said that I
                      was sorry)
      tevyu         to speak to, to talk to ("-vyu" = A/P-d)
      teka          to speak ("-ka" = AP/F-s activity; e.g. I spoke about
                      dolphins or I spoke a few words).  Use the
                      instrumental case tag "guswa" for the language being
                      used (e.g. I spoke guswa French = I spoke French).
      tevaw         to discuss, to talk/confer on/about ("-vaw" =
                      reciprocal)
      tesosoydi     utterance, statement, remark, comment, spoken words,
                      speech act, what someone said ("-so" = middle)
      tevawkwa      conversation, discussion, dialogue ("-kwa" =
                      event suffix)
      tetawdi       parrot ("taw" = bird)
      tebendi       vocal cords ("ben" = internal organ)
      tetwedi       laryngitis ("twe" = disease)
      tecodi        booze, liquor, alcohol ("co" = processed food)
      tegyadi       bar, pub, tavern ("gya" = place of business)
      texodo        sober ("xo" = positive binary non-relational state)
      texando       drunk, intoxicated, inebriated ("xan" = negative binary
                      non-relational state)
      tefawdi       forum, meeting place for discussions ("faw" = other
                      artificial location)
      tetodi        auditorium, hall ("to" = room)
      tezwedi       lectern ("-zwe" = furniture)
      tegodi        megaphone  ("go" = tool)
      tepundi       bullhorn, electric megaphone ("pun" = electrical item)
      tebyadi       telephone ("bya" = other device)
      fotebyadi     intercom ("fo" = low polarity)
      texidi        word ("xi" = performance component)
      betexidi      vocabulary ("be" = group semi-root)
      zutexidi      phoneme ("zu" = minimal polarity)
      fotexidi      morpheme ("fo" = low polarity)
      xetexidi      sentence ("xe" = high polarity)
      bitexidi      paragraph ("bi" = maximum polarity)
      teloda        give/deliver a speech/talk/address, address ("lo" =
                      activity)
      tejodi        speech, talk, oration, address ("jo" = complete
                      production)
      sendi         (a particular) language ("sen" = protocol classifier;
                      stand-alone meaning = 'language')
      zusendi       pidgin ("zu" = minimum polarity)
      fosendi       creole ("fo" = low polarity)
      sencindi      linguist ("cin" = member of academic profession)
      senzindi      linguistics ("zin" = academic profession or field of
                      study)

      Nasendi       the name of the interlingua ("na-" = proper name
              prefix)

Keep in mind that a modifying semi-root does not have to be semantically precise - it can be used for its approximate, metaphoric, or mnemonic value. It is only precise when it is used as a classifier or as a stand-alone root. <span id="S27_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 27.0 Using Words: Literalness, Polysemy, Metaphor, and Idiom

Throughout this monograph, we've seen many examples of derivations whose English counterparts were periphrastic, polysemic, metaphoric, or even idiomatic. In fact, when speakers of natural languages use non-literal language it is almost always because they are forced to do so. They cannot avoid it either because their vocabulary does not have an appropriate literal construction available, or because it is something that the speaker is not comfortable using.

This is unfortunate because the way that a non-literal construction will be interpreted will depend very much on the native language and culture of the listener. For example, metaphoric use of the word "pig" can have meanings such as "slob", "sex maniac", or "over-eater" in English, but will have different meanings to speakers of other languages. Also, as we've seen many times throughout this monograph, many metaphors, including the above examples, can be avoided by using appropriate derivations instead. For example, pejorative morphemes or more precisely derived compounds can be used to implement the above examples. In fact, I have become completely convinced that a properly derived word can replace **any** required or unavoidable metaphor, and it can never be misinterpreted by native speakers of other languages.

The goal of a designer of an MT interlingua should be to provide the means to say **anything** without the need for non-literal language. In other words, metaphor, polysemy, and idiom should be optional - they should **never** be obligatory. It is also my opinion that non-literal language should be generally avoided (except where its use is obvious to all listeners or readers), since the possibility for misunderstanding is so great.

\[If you would like to read more about the dangers of metaphor, see my separate essay entitled ["Metaphor"](http://www.eskimo.com/~ram/metaphor.html).\] <span id="S28_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 28.0 Final Word on Focus

At the very beginning of this monograph, I stated that the focus case role is vague and even somewhat "out-of-focus". Furthermore, even our working definition of focus is vague: that the focus is the referent of an actual or potential relationship with the patient, or the elaboration of an action.

Actually, I don't really think that the above definition is needed, even though I *do* believe that it is accurate. In fact, we can come up with a different and perhaps better definition if we look at our primary case roles as sets of binary features, an approach which is often quite useful in linguistics. There are only two features, agent and patient, and there are only four possible combinations:

        A  case role    ->    +agent, -patient
        P  case role    ->    -agent, +patient
        AP case role    ->    +agent, +patient
        F  case role    ->    -agent, -patient

In other words, the focus case role is the primary case role that has neither agent nor patient attributes.

Thus, focus is indeed vague, but it is definitely not ambiguous. <span id="S29_0"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## 29.0 Summary: A Comprehensive Lexico-Semantic System

I hope that by now I have convinced the reader of the value of a powerful derivational system. I cannot emphasize too much that a system like the one that I've described here will maximize the neutrality of the vocabulary of an artificial language, while completely eliminating the need for ad hoc and arbitrary word creation, thus making it ideal for an MT interlingua. It will also reduce to an absolute minimum the number of morphemes that a user of the language will have to memorize.

One of the greatest difficulties in learning a new language is mastering the idiosyncracies of the vocabulary. This is so because a word in one language rarely means exactly the same thing as its closest counterpart in a different language. In other words, the "semantic space" of each word in a natural language is arbitrary - the result of centuries of evolution and accident. In effect, each word of a natural language has built-in irregularities that the student must learn.

Unfortunately, most language designers unwittingly clone their native vocabulary, not realizing the difficulty that will be faced by potential users of the language. The net result is that the meaning of a word cannot be deduced from more basic and universal concepts that have the same meaning for everyone, but instead depends almost exclusively on its meaning in only one natural language - the native language of the designer.

In such a design, as in the natural language on which it is based, the semantic space of each word is arbitrary, and mastering the idiosyncracies of the entire vocabulary will take years of effort. Thus, different speakers **will** use the words differently, and misunderstandings **will** occur because there are no rules that can be followed to determine the precise semantic space of a word. Instead, each speaker will use the word in the same way he would use the closest equivalent in his native language.

In the system described here, the semantic space of each word is precisely defined in terms of the much more basic meanings of the components that make up each word. And while there may be some arbitrariness in the selection of the root concepts, the overall arbitrariness of the entire vocabulary will be much, much less. Thus, even though we may never be able to achieve true neutrality, we can certainly come very close. <span id="APPENDIX_A"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## APPENDIX A: The Phonology and Morphology of the Interlingua

Definitions:

        () indicates that the enclosed item is optional
        {} indicates that the enclosed item may appear zero or more
           times
        [] indicates that the enclosed item must appear one or more
           times
        | ::= logical or
        V ::= any vowel ::= a | e | i | o | u
        S ::= any semi-vowel ::= w | y
        C ::= any consonant ::= b | c | d | f | g | j | k | l | m
                    | n | p | q | r | s | t | v | x | z

A vocalic nucleus N has the following form:

        N ::= (S) V (S) (V) (S) ...
        examples: e, yo, we, aw, ay, iwa, ayu, ea, etc

More precisely, a vocalic nucleus can consist of one or more vowels, and, if there is more than one vowel, then 'i' or 'u' is converted to the corresponding semi-vowel 'y' or 'w'. For example, "eua" becomes "ewa". I'll have more to say about this later.

A morpheme has the following form:

        morpheme ::= C N (n)

A prefix has the form:

        prefix ::= n N (n)
            (eg, na, naw, noyu, nea, nun, etc)

A suffix has the form:

        suffix ::= d N  or  k N  or  s N  or v N
            (eg, sa, dwa, koyu, vay, etc)

A suffix changes the syntax and semantics of a word in a precise (i.e., totally predictable) way. For example, if we add the A/P-d suffix "-vyu" to the root "cabo" (meaning 'duck'), the result "cabovyu" means 'to turn P into a duck', which is a dynamic state verb. In other words, we have changed both the syntax and meaning from a 'bird' noun to a 'change-of-state' verb. In fact, even a simple part-of-speech change that does not change the argument structure DOES change the syntax because the two different words can not be used in the same context. For example, "konda" (meaning 'to know') and "kondi" (meaning 'knower') cannot be used in the same context because "konda" is a verb that requires arguments while "kondi" can only BE an argument.

In summary, a prefix modifies the meaning of the entire word that follows it without changing its syntax. A suffix changes both meaning and syntax of the root plus any intervening suffixes. In other words, we start with the root, add the suffixes, and then add the prefixes to obtain the final meaning.

Many suffixes have a default part-of-speech. Thus, an additional part-of-speech suffix is not needed if the default applies.

A root-terminator has the form:

        root-terminator ::= m N  or  p N
            (eg, mi, pyo, moyu, paw, etc)

Root-terminators are used for closed class words that have unusual syntactic or semantic properties, such as demonstratives, conjunctions, quantifiers/numerics, locatives, and particles.

A semi-root has the form:

        semi-root ::=
        any morpheme not reserved for prefixes, suffixes, and root
        terminators.  Note that this includes morphemes that start
        with 'd', 'k', 's', 'v', 'm', and 'p', and end with 'n'.
        For example, "san" is a valid semi-root even though "sa"
        is a suffix.

A root is defined as follows:

        unterminated-root ::= [semi-root]
        terminated-root   ::= {semi-root} root-terminator

        root ::= unterminated-root | terminated-root

The rightmost morpheme of a root is called the *classifier* of the root.

Finally, words have the following forms:

        word ::= {prefix} unterminated-root [suffix]
           | {prefix} terminated-root   {suffix}

        anaphor ::= morpheme h part-of-speech-vowel

Note that a root-terminator may be preceded by zero or more semi-roots **but may not be followed by one**. Thus it automatically terminates a root. Because of this, a separate part-of-speech suffix will not be needed if the default applies. Unterminated roots must ALWAYS be followed by at least one suffix which will terminate the root and indicate the part-of-speech.

The above approach is completely self-segregating at both the morpheme and word level. In addition, the syntax of the language will ensure self-segregation at the constituent and sentence levels.

As for pronunciation, vowels are cardinal, although laxer versions are acceptable (i.e., pronounce vowels as in Italian or Swahili). Pronounce /w/ as in "awake", /y/ as in "soybean", /c/ like "ch" in "chin", /j/ as in "judge", /x/ like "sh" in "ship", /q/ like "s" in "measure", and /r/ as any rhotic (flap, trill, retroflex, uvular, etc). The consonant /h/ may be pronounced like 'h' in "house", as a glottal stop (i.e., like "tt" in "button"), or as \[x\] (i.e., like "ch" in German "acht"). \[More generally, /h/ may be pronounced as a glottal stop or as any unvoiced velar, uvular, pharyngal, or glottal fricative.\]

If 'n' precedes another consonant, it may be pronounced homorganically. For example, "tenpo" can be pronounced like English "tempo", and "lingo" can be pronounced exactly as in English.

Geminates (i.e., two or more consecutive, identical vowels, semivowels, or consonants) are not allowed. For example, "xx", "bb", "uu", and "yy" are not allowed. The sequences /uw/, /wu/, /iy/, /yi/, /ou/, /ow/, /ei/, /ey/, /ao/, /ae/, /wy/, and /yw/ are also not allowed. However, it is always legal to pronounce /e/ as either \[e\] or \[ey\], and /o/ as either \[o\] or \[ow\]. For example, /ea/ may be pronounced \[ea\] or \[eya\], and /oa/ may be pronounced \[oa\] or \[owa\]. The vowels 'i' and 'u' may never appear adjacent to another vowel - use 'y' or 'w' instead. For example, the roots "faija" and "tuenze" are illegal, but "fayja" and "twenze" are legal. If 'i' and 'u' are adjacent, convert the first to a semi-vowel. Thus, "ui" becomes "wi" and "iu" becomes "yu".

Although stress is not necessary, we will adopt the following convention for the sake of consistency:

        Each word should be stressed on the first vowel of the root.  If
        there is at least one vowel between the first root vowel and the
        penultimate (i.e., the next-to-last) vowel of the entire word, then
        the penultimate vowel should also receive stress.

<span id="APPENDIX_B"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## APPENDIX B: Prefixes, Suffixes, and Compositional Roots of the Interlingua

This appendix contains a complete list of all prefixes, suffixes, and compositional semi-roots of the interlingua. Classifiers are listed in [Appendix C](#APPENDIX_C). Semi-roots with their stand-alone, classifier, and modifier meanings are listed in [Appendix D](#APPENDIX_D).

Prefixes:

        nu-     generic noun
        ni-     plural, more than one
        naw-    male
        noy-    female
        no-     negator: un-, non-, not, other than
        ne-     quality or ability
        nin-    kind/type-of
        na-     proper name
        nen-    mnemonic name

      Register prefixes:

        naye-   humble, inferior, fawning, groveling, subservient
        nea-    praising, complimentary, flattering
        nye-    polite, respectful, formal
        --      neutral (default)
        newi-   slang, informal
        nyo-    cold, unfriendly, unsociable
        noa-    contemptuous, rude, insulting
        nayo-   vulgar, filthy, tasteless

Suffixes:

      Basic argument structure suffixes (all are verbs by default):

          A/P/F-s: -va     A/P/F-d: -vu
          A/P-s:   -vya    A/P-d:   -vyu
          AP/F-s:  -ka     AP/F-d:  -ku
          AP-s:    -kya    AP-d:    -kyu
          P/F-s:   -sa     P/F-d:   -su
          P-s:     -sya    P-d:     -syu

        The above should only be used if the default argument structure is
        being changed.  To change just the part-of-speech of a root, use an
        appropriate part-of-speech suffix instead (see below).

      Non-linking suffixes (adverb/case tags by default):

          0/A:    -ve
          0/AP:   -ke
          0/P:    -se
          0/F:    -swa
          0:      -koy

      Special suffix:

          -kaw    same arguments and part-of-speech as first conjunct -
                      nothing can follow this suffix!!!

      Derivational suffixes:

          -swi    get/determine/measure state (result = AP/F-d verb)
          -ko     apply/use noun to/on patient (to brush, to knife, to
            pencil, etc - result = A/P-d verb)
          -vye    add noun to patient (to water, to stamp, to salt,
            to cover, etc - result = A/P-d verb)
          -vyo    remove noun from patient (to erase, to de-salt, to
            undress, to strip paint from, etc - result = A/P-d verb)
          -vay    process/mass noun (result = noun, structure unchanged)
          -kwa    event/count noun (result = noun, structure unchanged)

      Voice suffixes (These do not change the part-of-speech; exception:
        "ma" plus some voice suffixes have special defaults.):

        [Note: an earlier version of this interlingua had voice morphemes
        for anti-anti-passive and anti-anti-middle, which I have not
        implemented in the current version.  Instead, if it's necessary to
        demote the focus of a ditransitive verb, one of the unfocused A/P
        suffixes can be used to represent a combined anti-anti-passive and
        anti-anti-middle operation.  Obviously, this implies that the focus
        of these verbs can never be expressed obliquely and that we can no
        longer make a semantic distinction between anti-anti-passive and
        anti-anti-middle.  However, I do not consider this a disadvantage
        because I know of no natural language that can do these things.]

          -kwe    inverse (A/P/F-x -> P/A/F-x)
          -say    reflexive (object is identical to subject, for states
                    A/P/F becomes A=F/P, for actions A/P/F becomes A=P/F)
          -vaw    reciprocal (A/P/F -> A+P/F)
          -saw    P+F reciprocal (A/P/F -> A/P+F)
          -vo     passive
          -so     middle
          -voy    anti-passive
          -soy    anti-middle
          -si     co-subject (comitative, demotes part of the subject and
                    makes it obliquely expressable)
          -kay    non-subject (anti-comitative, an entity is specifically
                    excluded from being subject)

      Special voice suffix (always a verb):

          -vi     infinitive - nothing can follow this suffix!!!

      Part-of-speech suffixes:

          Verb:                    -da
          Noun:                    -di  open: -daw
          Adjective:               -do  open: -du
          Adverb/Case tag:         -de
          Previous-word modifier:  -day  open: -dwe
          Vocative:                -dya
          Imperative:              -doy

      Special suffix:

          -ki     interrogative ("-ki" does not change part-of-speech)

      The order of suffixes is not semantically important.  However, for the
      sake of consistency, the following order is recommended since it is
      the order in which they are processed:

        closest to the root
          - a basic argument structure, non-linking, same args or
              derivational suffix
          - one or more voice suffixes (excluding infinitive suffix)
          - infinitive suffix
          - a part-of-speech suffix
          - interrogative
        farthest from the root

      If suffixes are not in the above order, the word will be processed as
      if they were in the above order.  For example, "kondisyu" will be a
      noun even though "syu" is the last morpheme because the correct order
      is "konsyudi".

      Note that nothing can follow a same-args suffix or an infinitive
      suffix.

Scope of prefixes and suffixes:

      In general, all suffixes are applied to the root to create a basic
      stem and then prefixes are applied to modify the meaning of the
      result.  However, the order of analysis will be the order that makes
      sense.  For example, a derivational suffix must apply BEFORE any voice
      suffixes so that the argument structure can be changed if needed.
      Also, a quality prefix must apply AFTER any voice suffixes so that the
      correct argument slot can be selected before being converted to the
      quality associated with that argument.

Polarity semi-roots:

      A polarity semi-root creates an effective new root whose meaning
      depends on the nature of the unmodified root.  For scalar states, the
      degree of the state will be changed (e.g. warm vs. hot).  For physical
      nouns, the size will be changed (e.g. lake vs. pond).  For sentient
      concepts, the degree of age, rank, or experience will be changed
      (e.g. pope vs. bishop, college vs. high school, etc.)  If there are
      insufficient degrees of polarity, then more than one can be used
      (e.g. sergeant vs. master sergeant)

          bu-     0% polarity
          bi-     maximal polarity
          xe-     high polarity
          la-     average polarity
          fo-     low polarity
          zu-     minimal polarity
          fin-    too, excessively, over-
          ge-     enough, adequately, sufficiently
          zay-    almost, not quite, nearly, all but, well-nigh
          to-     just, only, exclusively, simply
          ci-     about, approximately, circa, more or less
          zi-     exactly, precisely, no more and no less

Numerics:

      The numeric classifier is the root-terminator "-mu".

      Numeric semi-roots:

          xay-    minus sign (default = positive)

          --      cardinal (This is the default.)
          -ta     ordinal
          pan-    previous, minus one-th ordinal
          pun-    next, plus one-th ordinal
          -faw    N-ary, Nth in importance, rank, or value
          -ji     N-tuple, N of a kind, N in one
          -be     N at a time, N per group, in groups of N

      Numeric components:

          bu-     zero
          ca-     one
          fe-     two
          gi-     three
          jo-     four
          lu-     five
          ba-     six
          ze-     seven
          ti-     eight
          xo-     nine

      Numeric linkers:

          -loy-   decimal point
          -tu-    exponent
          -co-    negative exponent
          -zoy-   real/imaginary separator
          -go-    fraction, X/Y

        Simple numbers are formed by appending the root-terminator "-mu"
        to the digit.  For example, "timu" = 'eight', "cabubumu" or
        "catufemu" = 'one hundred", "zetamu" = 'seventh', and "gifawmu" =
        'tertiary'.  Larger numbers are formed by linking individual
        digits and terminating them with "-mu".  For example, "zebucamu" =
        701, "febumu" = 20, and so on.

        If a linker does not have a number to its left, then the default
        is assumed to be "bu" = 'zero' for decimal point and real/
        imaginary separator, and "ca" = 'one' for all the other linkers.
        For example, "loyluzemu" = 0.57, and "gogimu" = 'one-third'.  If
        the fraction linker "-go-" does not have a string to its right, it
        will be assumed to be 'all', and only a polarity semi-root may
        precede "-go-".  For example, "xegomu" means 'a large fraction of'
        or 'most'.

        All numeric roots terminated by "-mu" are P-s adjectives by
        default.  And since "-mu" is a root-terminator, a part-of-speech
        suffix is not needed if the word is an adjective.

        Some numeric operations (classifier = "-bun", all are P/F-s
        verbs by default):

          xebun   addition
          ?????   subtraction
          ?????   multiplication
          ?????   division

        Non-specific numeric words are formed from the scalar polarity
        morphemes plus the numeric classifier "-mu", as follows:

          bimu    all, every, the whole amount of, the maximum amount
                  possible of
          xemu    many, much, lots of, a lot of, a large amount of,
                  numerous, plenty of
          lamu    several, some, a moderate/average/typical amount of
          fomu    a few, a little, a small amount of, not too many, not
                  too much 
          zumu    very few, very little, a tiny/minimal amount of, hardly
                  any, almost no
          mu      any, some, a number/quantity/amount of
          muki    how much?, how many?, what quantity of?

Deictic roots:

        Stand-alone classifiers are 1st person by default; i.e. "mi" means
        'I/me', "poy" means 'my', "pe" means 'this', "paw" means 'now', and
        "may" means 'here'.

          Person        Deictic Type        Default
        -----------    --------------   --------------
        1:      --     Pers:   -mi       P-s noun
        2:      fe-    Gen:    -poy      P-s adjective
        3:      gi-    Dem:    -pe       P-s adjective
        1+2:    jo-    Loc:    -paw      "0" adverb
        1+3:    lu-    Tem:    -may      "0" adverb
        2+3:    ba-
        1+2+3:  ze-

Tense-aspect roots:

        By default, unmodified "pa" is past-perfect, "pi" is present-
        imperfect, "pu" is future-perfect, "pay" and "pyu" are both perfect,
        and "maw" is imperfect.  All tense-aspect roots are deictic
        disjuncts by default.

               Aspect                 Tense
        --------------------   --------------------
        Perfective:     jay-   Past:           -pa
        Imperfective:   kun-   Present:        -pi
        Iterative:      xwe-   Future:         -pu
        Habitual:       ji-    Past+Present:   -pay
        Inceptive:      ca-    Present+Future: -pyu
        Continuative:   fe-    Unspecified:    -maw
        Terminative:    bu-
        Resumptive:     gi-
        Completive:     jo-
        Unspecified:    lu-

Modality roots (default = deictic disjunct):

                 Modality              Morpheme
        --------------------------    ----------
        Probability (epistemic)         me
        Evidentiality (epistemic)       lime
        Inevitability (epistemic)       tonme
        Acceptability (epistemic)       geme
        Significance (epistemic)        fawme
        Hedge (epistemic)               xwame
        Counterfactuality (epistemic)   zanme
        Reasonableness (epistemic)      benme

        Obligation (deontic)            mo
        Necessity (deontic)             byomo
        Consequentiality (deontic)      jomo

Color semi-roots (classifier = "-bye", P-s adjective by default):

        Color Components
          --------------------
          black           bu-
          purple          gi-
          blue            taw-
          green           don-
          yellow          jin-
          orange          le-
          red             xu-
          white           ba-

      Shades:
          normal          (default)
          deep            xe-
          pale            fo-

      Simple colors are formed from a single color component plus "-bye".  For
      example, "bubyedo" = 'black', "donbyedo" = 'green", "xedonbyedo" = 'deep
      green', "fojinbyedo" = 'pale yellow', and so on.  If two primary colors
      are combined, the rightmost component will indicate the major color.
      For example, "bubabyedo" = 'black white' = 'gray'.  Here are some more
      examples:

          white           babyedo
          orange          lebyedo
          yellow          jinbyedo
          purple          gibyedo
          brown           lebubyedo = orange black
          pink            xubabyedo = red white
          magenta         tawxubyedo = blue red
          turquoise       fodontawbyedo = light greenish-blue

Kinship roots:

        classifier = "-kin" (default = P/F-s noun)

        ja - parent (either sex)
        ji - female parent
        ju - male parent

        za - sibling (either sex)
        zi - female sibling
        zu - male sibling
        bi - sibling of the same sex
        bu - sibling of the opposite sex

        ga - child (either sex)
        gi - female child
        gu - male child

        pan - ancestor of (the parent and everyone above on the tree)
        pun - descendent of (the child and everyone below on the tree)

        ta - spouse (either sex)
        ti - female spouse
        tu - male spouse

        xe - modifier meaning 'older'
        fo - modifier meaning 'younger'
        le - referent/focus is female
        lo - referent/focus is male
        cewe - modifier meaning 'adopted'

        A kinship morpheme modifies everything to its right, and the
        rightmost semi-root is the head morph.  Thus, "jajikindi" =
        "parent's mother" = 'grandmother'.  The word "jijakindi",
        however, means "mother's parent" = 'maternal grandparent'.

Comparative words:

        bimwa = 'most'
        xemwa = 'more'
        lamwa = 'as much/many'
        fomwa = 'less/fewer'
        zumwa = 'least'
        mwaki = 'how (much)', 'to what degree'

        tupye  = 'than', 'as', 'compared with'

Other particles and related items:

        Unknown number marker:          zimwa   (For use in machine
                             translation only.)
        Unknown definiteness marker:    cimwa   (For use in machine
                             translation only.)
        Contrasting topicalization
           particle:            bawmwa
        Heavy topicalization particle:  bonmwa
        Reference-switching particle:   xwamwa
        Opening parenthesis:            kunmwa
        Closing parenthesis:            jaymwa
        Parenthetical start:            camwa
        List separator:                 fepye
        Quote start:                    temwa
        Proper expression start:        namwa
        Spelling start:                 gwemwa
        Parenthetical/quote/proper/
            spelling stop:
            complete                jomwa
            incomplete              bumwa
        Valency terminator:             tawmwa

<span id="APPENDIX_C"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## APPENDIX C: Classifiers of the Interlingua (with examples)

Each word in Nasendi consists of zero or more optional prefixes, a single mandatory root, and zero or more optional suffixes. In this appendix, we are only concerned with the root and its components.

Each root consists of one or more semi-roots, and each semi-root has a default class; i.e., a default semantics and syntax. The class of a root that has more than one semi-root is determined by the rightmost semi-root, and this semi-root is referred to as the *classifier*.

A class can contain more than one classifier; i.e. it can contain sub-classes, and they, in turn, can also contain sub-classes. For example, the 'vehicle' class has a classifier meaning 'water vehicle' and an additional classifier meaning 'other vehicle'. Each specific type of water vehicle (eg. canoe, raft, rowboat, barge, catamaran, cruise ship, pinnace, etc) will use the 'water vehicle' classifier, while non-water vehicles will use the 'other vehicle' classifier. In effect, the 'water vehicle' class and the 'other vehicle' class are sub-classes of a more general, implied 'vehicle' class.

A stand-alone classifier (i.e., one that is not modified by other semi-roots) will represent a specific member of the class, rather than the entire class. For example, the 'bird' class has a 'bird of prey' sub-class. When the 'bird of prey' classifier is used alone, it will actually represent the particular category of birds called 'hawks' rather than the more general meaning 'bird of prey'. This classifier can then be modified by other semi-roots to represent other birds of prey such as 'eagle', 'falcon', 'vulture', and so on. If we need to create a root representing the entire class, we will modify the classifier with the semi-root "ce", meaning 'member'. For example, the 'member' semi-root plus the 'bird of prey' classifier means 'bird of prey', and can refer to any member of the class.

Classes that have sub-classes will have one final class called an 'other' class, and "ce" will be used with this classifier to represent any member of the larger class. For example, there are several 'bird' sub-classes (such as the 'bird of prey' class mentioned above), and one final class called the 'other birds' class. This final class will be used for all bird species for which there is not a more specific bird class, and the root meaning 'bird' is simply "ce" plus the 'other birds' classifier.

The member semi-root "ce" will not be applied to a classifier unless the result is useful and has a counterpart in many natural languages. For example, there is a classifier for 'government and military groups or organizations'. Since I doubt that any natural language has a single word to represent this concept, we will not create a generic word using "ce" plus this classifier.

Note that a specific member of a class does not have to represent a single species or a single kind or type of entity. For example, there is a stand-alone semi-root meaning 'crab' that does not have any sub-classes, even though there are several species of crab. (This also applies, of course, to 'hawk'.)

The classifier semi-root of a root is semantically and syntactically precise. However, the semi-roots to the left of a classifier will provide no syntactic information at all and may not necessarily be semantically precise, but **will** provide semantic clues that will help the student remember the meaning of the complete root. In other words, the semi-roots to the left of the classifier will be used for their *mnemonic* value to modify the classifier. The classifier, however, will always be semantically precise. For example, the root meaning "bicycle" consists of the numeric semi-root meaning 'two' plus the 'other vehicle' classifier.

Also, some modifier semi-roots can have completely different meanings in different contexts. For example, the modifier semi-root with the meaning 'six' would be useless with most classifiers except the numeric classifier and certain shapes (such as the hexagon). In cases like this, the semi-root can be given one or more completely different modifier meanings that will be more useful in other contexts. Even so, however, we will always try to assign multiple meanings that are at least somewhat reminiscent of or related to each other. For example, the semi-root meaning 'six' will have the alternate meanings 'spider' (because a spider has six pairs of appendages and typically has six spinnerets), 'web/net', 'catch/trap', 'six', and 'white'.

In summary, a semi-root is used in four ways:

      1. as a stand-alone root which represents a specific member or
         sub-group of its class (eg. 'hawk' or 'crab')

      2. as a classifier that can be modified by other semi-roots to
         represent other specific members of its class (eg. 'osprey' of
         the 'bird of prey' class or 'hermit crab' of the 'crustacean'
         class)

      3. as a classifier modified by the 'member' semi-root to represent
         any member of the class (eg. a single root meaning 'bird of
         prey' or 'crustacean')

      4. as a semi-root that modifies other classifiers and provides a
         mnemonic clue to the meaning of the result (eg. the 'spider'
         semi-root can be used as a modifier to derive new roots with
         meanings such as 'weave', 'silk', 'web', 'six', and so on.

Thus, the approach used here will allow an entire, easily learned vocabulary of roots to be flexibly designed using a relatively small number of semi-roots.

Now, here are the classifiers (for a complete, alphabetical list of all semi-roots that includes their stand-alone, class, and modifier meanings, see [Appendix D](#APPENDIX_D)).

All matter, energy, and time classifiers are P-s nouns by default:

Mammals:

      -bay  Marine mammals (dolphins, whales, dugongs, manatees, seals)
      -von  Ungulates (hooved mammals):
          Artiodactyla (camels, cattle, deer, giraffes, goats, hippos,
            llamas, pigs, sheep)
          Perissodactyla (horses, rhinoceroses, tapirs)
          Proboscidea (elephants, mammoths)
      -ju   Carnivora (domestic dogs and cats, coyotes, foxes, bushdogs,
            hyenas, jaguars, lions, tigers, badgers, bears, weasels,
            otters)
      -pin  Primates (monkeys, lemurs, gorillas, marmosets, humans,
          tamarins, orangutans, vervets)
      -cen  Marsupialia (kangaroos, koalas, wombats)
      -law  Lagomorpha (hares, rabbits, pikas)
      -ga   Rodentia (hamsters, mice, porcupines, cavies, chinchillas)
      -tyo  other mammals:
          Insectivora (hedgehogs, moles, shrews)
          Chiroptera (bats, flying foxes)
          Dermoptera (flying lemurs)
          Monotremata (egg-laying mammals: echidna, platypus)
          Edentata (anteaters, armadillos, sloths)
          Pholidota (pangolins)
          Tubulidentata (aardvarks)
          etc.

Birds:

      -man  Struthioniformes (ostrich, rhea, cassowary, emu, kiwi) and
          Tinamiformes (tinamous)
      -bo   Fowls: Galliformes (chicken, pheasant, grouse, quail, turkey)
          and Anseriformes (goose, duck, swan, screamer)
      -ci   Passeriformes; aka. passerines or perching birds (thrush,
          sparrow, finch, mockingbird, magpie, lark, chickadee,
          cardinal, crow, flycatcher, jay)
      -zen  Falconiformes; i.e. "birds of prey" (hawk, eagle, osprey,
          buzzard, falcon, vulture)
      -gwi  Sea birds: Pelecaniformes (pelican, boobie, cormorant),
          Procellariiformes (albatross, petrel), Podicipediformes
          (grebes), Sphenisciformes (penguin), Gaviiformes (loon),
          Charadriiformes (gull, shorebird)
      -taw  other birds (owl, woodpecker, kingfisher, hummingbird, parrot,
          cuckoo, pigeon, crane, stork)

Reptiles:

      -sin  snakes (boa, cobra, viper, rattlesnake, grass snake)
      -loy  other reptiles (lizards, turtles, dinosaurs, alligators/
          crocodiles) 

Amphibians:

      -fwa  all (toad, newt, frog, salamander)

Fish:

      -sun  Chondrichthyes; i.e. fishes with a cartilage skeleton (sharks,
          rays, skates, stingrays)
      -je   Osteichthyes; i.e. fishes with a bony skeleton (mackerel, perch,
          sardine, flounder, puffer, catfish, bass, tuna, cod, minnow,
          flying fish, eel, seahorse)
      -zo   other fishes: Agnatha (lampreys and hagfishes), others?

Other vertebrates:

        There are no other vertebrates.  However, since we need a
          classifier to create the word meaning 'vertebrate', and since
          we don't want to allocate a unique classifier for just one
          word, we will use the 'other fishes' classifier "-fi" to
          create this word.

Arthropods:

      -con  Crustacea (lobster, krill, crab, shrimp, water flea,
          barnacle)
      -ba   Arachnida (spider, tick, mite, scorpion)
      -ken  Coleoptera (beetle) and Orthoptera (grasshopper, cricket,
          katydid)
      -xay  Diptera (flies, mosquitos) and Odonata (dragonflies,
          damselflies)
        Hymenoptera:
      -le     Bees and wasps - Apidae, Bombidae, Vespidae, etc
      -goy    Ants and related species - Dorylinae, Formicidae, etc
      -fyu  Lepidoptera (moth, butterfly)
      -ti   other Arthropods (insect, aphid, cicada, stink bug, louse,
          centipede, sea spider)

Other animals:

      -twi  Bivalvia (clams & mussels)
      -mon  Gastropoda (snails & slugs)
      -zay  Cephalopoda (squids & octopuses)
      -din  others (worm, jellyfish)

Plants (Note that these classes refer to the entire plant. For the edible part of the plant, use "-fa".):

      -pan  softwood trees (pines, junipers, redwoods, spruce)
      -mun  fruit and nut trees (apple, cherry, plum, peach, walnut)
      -xa   other trees - broad-leaved hardwoods (maple, ash, elm, oak,
          poplar, elder)
      -gi   grains (wheat, barley, rice, corn, oats, other grasses)
      -foy  herbs and spices (pepper, rosemary, parsley, tarragon, basil)
      -bwa  edible root plants (carrot, turnip, beet, potato, onion)
      -jen  other food plants (bean, squash, spinach, tomato, cabbage,
          eggplant, celery, asparagus, melon, peanut, strawberry)
      -don  other plants, including kingdom Fungi (e.g. vines, ferns,
          seaweed, moss, fungi, wort, shrubs, mushrooms)

Living organs and components of plants and animals:

      -ben  internal animal organs (liver, heart, pancreas, gland, muscle,
          tendon, bladder, brain, vocal cords)
      -lu   external animal organs (hand, head, chest, tail, eye, chin, ear,
          abdomen, body, skin; i.e., any organ that can be easily seen
          from outside the body or is normally or frequently exposed,
          such as the tongue and the gums.)
      -fa   edible parts of plants (vegetable, potato, apple, bean, cherry,
          cabbage (the edible head), turnip, spinach (the leaf), peach,
          rice (the grain), banana).  The name of the whole plant for a
          member of this class will be formed with the same semi-root
          plus an appropriate plant classifier.  For example, "gifadi" =
          lemon (the fruit), while "gimundi" = 'lemon tree'.
      -xoy  other organs or body parts (organ, fruit, seed, leaf, branch,
          nut, berry, root, cell, rind, mitochondria, tuber)

Illnesses and diseases:

      -twe  all (illness, disease, flu, malaria, diabetes, claustrophobia,
          upset stomach)

Wounds and Growths:

      -lin  all (blister, boil, scab, ulcer, tumor, sore, rash)

Other living matter & energy:

      -gwa  all (organism/lifeform/living thing, species, virus, plus all
          members of kingdoms Monera and Protista: bacteria, amoeba,
          microbe, germ, algae, spirochete, protozoans, slime mold)

Non-living, natural matter & energy:

      -ton  weather phenomena (tornado, rainbow, flood, blizzard, climate,
          snow(fall), typhoon, (weather) front, wind, storm, cloud)
      -jin  other phenomena (hot spring, earthquake, volcanic eruption,
          mudslide, life, species, fire/blaze, waterfall, sunspot,
          sun, star, galaxy, instinct)
        [A word such as "hot spring" could also be implemented as a
        locative.  However, since its most salient feature is its
        implied energy, it will instead be derived using this class.
        Also, note that even though we have allocated classifiers for
        specific kinds of life, 'life' itself is a natural phenomenon.]

Non-living, artificial matter & energy:

      -joy  water vehicles (boat, canoe, catamaran, rowboat, ship, ocean
          liner, submarine, sailboat, raft)
      -kan  other vehicles (automobile, bulldozer, airplane, locomotive,
          rickshaw, bicycle, truck, train)
      -xwe  power tools (jackhammer, lathe, lawnmower)
      -fin  powered weapons (rifle, bomb, cannon, missile)  [See comment
          after "-kwin".]
      -gaw  musical instrument (guitar, flute, piano, synthesizer, organ)
      -pun  passive electrical components which (typically) modify or
          transform energy (resistor, transistor, light bulb, battery,
          transducer, speaker, capacitor, keyboard, anode)
      -bya  other devices (windmill, jacuzzi, oscilloscope, generator,
          transmitter, refrigerator, telephone, washing machine,
          turbine, computer, clock/watch, walkie-talkie, television)

Natural substance:

      -gen  chemical elements (hydrogen, oxygen, sodium, chlorine, uranium)
      -ca   inorganic compounds (water, sodium chloride, potassium sulfate)
      -byo  biochemicals, including drugs (aspirin, medicine, vitamins,
          insulin, DNA, nucleotide, amino acid, drugs for high blood
          pressure, depression, heart disease, etc)
      -jun  other organic compounds (methane, butanol, polybutadiene,
          benzoic acid, chlorobenzene, dimethylamine)
      -xu   plant/animal substances and mixtures (blubber, frankincense,
          beeswax, fur/hair, beef, honey, blood, wood, marrow, milk,
          feces, coral, tears, spit/spittle, urine) 
      -vin  other (air, coal, soil, clay, bauxite, dust, sand, ore, ruby,
          snow, gypsum)

Natural location:

      -cu   bodies of water (river, bay, lake, swamp, puddle)
      -fe   other (cave, cliff, island, mountain, desert, forest, beach,
          continent, peninsula, planet, pole (e.g. 'North Pole'),
          sky, outer space, glacier)

Natural other:

      -twa  organic thing (shell, claw, tooth, hair (single), feather, bone,
          skull)
      -dun  inorganic thing (raindrop, boulder, stalagmite, snowflake,
          atom, molecule, subatomic particles such as neutron and
          electron)
      -gay  other (beehive, nest, den/burrow, cocoon, spiderweb)

Artificial substance:

> This section contains substances that are explicitly man-made and which cannot occur in nature without some processing. All other substances (including all drugs and other relatively pure chemical compounds) should be considered natural, even if they do not occur naturally on Earth.

      -co   processed food substance (gravy, mustard, spices and herbs,
          cheese, beer, sugar, flour, vegetable oil, coffee, (table)
          salt, syrup, soup)
      -ge   other (brick, steel, alloy, paint, cloth, soap, glue, ink,
          gasoline, plywood, salve, medicine, glass, paper, cement,
          antiseptic, gunpowder)

Artificial location:

      -gya  places of business where customers typically pay for goods or
          services (bakery, restaurant, hotel, shopping mall, zoo,
          doctor's office, bazaar, gas station, museum, hospital)
      -ji   other buildings (house, stadium, skyscraper, library, shed,
          garage)
      -to   enclosed, functional sections of buildings (room, pantry,
          kitchen, bedroom, cell, parlor, attic, hallway, prison/jail
          cell, apartment, closet, basement/cellar, porch, balcony)
      -xin  large (typically political) divisions (nation, city, county,
          region, district, colony, village, suburb, state/province,
          kingdom)  Use "-baw" for specific government types such as
          "monarchy", "republic", etc.  The word "empire" will appear in
          both classes, even though English does not differentiate
          between the government type and the political location.
      -men  sites or areas that typically contain more than one building
          or a relatively large plot of land (enclave, commune, farm,
          ranch, school/university, factory, refinery, prison, military
          base)
      -lay  infrastructure (park, canal, dike, road, trail, reservoir,
          plaza, interchange, marketplace, parking lot)
      -bon  supporters (bleachers, platform/stage, gallows, wharf,
          staircase, ladder)
      -faw  other (garden, patio, yard, home/residence(?))

Artificial other:

      -lun  beverage (cocktail, milkshake, coffee, soda pop)
      -fu   other food item (food, pizza, lollipop, steak, TV dinner, egg
          roll, taco, sandwich, cake, bread loaf, pie, ham, sushi)
      -zwe  item of furniture (chair, table, bed, sofa, bookcase, desk,
          tripod)
      -son  item of clothing (shirt, hat, shoe, sleeping bag, coat, tie,
          belt, sleeve, collar)
      -ja   informative/artistic/entertaining/social (map, book, CD-ROM,
          painting, statue, tombstone, flag, encyclopedia, toy, coin,
          award/prize, photograph, money, letter/missive, flagpole)
      -kwin non-powered, hand weapons (club, spear, bow, arrow, dagger,
          morning star, sword, pike, battle-ax, quarterstaff)
          [The word meaning 'weapon' is "cekwindi" and includes all
          weapons, even those having classifier "-fin".]
      -go   tools, utensils, and non-powered instruments (tool, knife,
          hammer, key, glasses/spectacles, scissors, pencil, telescope,
          brush, broom, fork, colander, whisk, ladle, thermometer,
          ruler, scale, towel, compass, level, calipers, gauge,
          hourglass, abacus, sponge, handkerchief)
      -tay  conduits (hose, pipe, tube, faucet, gutter, airduct, wire, power
          cord, chimney, tailpipe, pane (eg. of glass), lens)
      -pen  containers (box, tank, bottle, basket, bucket, sack, case,
          suitcase, aquarium, fireplace, cupboard, trunk (of a car),
          sink, cup, bowl, pan, bathtub, drawer, tent)
      -can  separators (mat, fence, carpet, curtain, door, window, shelf,
          cage, floor/ceiling, roof)
      -byu  connectors (rope, pin, hook, nail, clip, shoestring, button (on
          clothing), hinge, anchor, spring, zipper, chain)
      -dan  other (hanger, plug/stopper, cap, needle, shingle, doorknob,
          wheel, tile, rudder, trigger, handrail, pushbutton, flywheel,
          page)

Living energy (i.e., supernatural and primarily non-physical):

      -pon  all (I was going to have two categories, religious and
          mythological, but I figured that it might cause nasty
          arguments.  Note that "cepondi" = 'spirit/soul')

Non-living energy:

      -fye  count nouns (sunray, thunderclap, lightning bolt, spark,
          explosion, a sound/noise)
      -den  other non-living energy - mass nouns (sunshine, thunder,
          lightning, electricity, hydropower, force/pressure, radar,
          heat, energy, sound/noise, voltage, sound volume)

Time:

      -jay  point in time (midnight, sunrise, 6 o'clock)
      -kun  other times - periods of time (summer, morning, fall equinox,
          childhood, monsoon)

<span id="group_class"></span> Abstract nouns (all are P-s nouns by default unless stated otherwise):

Groups/organizations (including government types):

      -baw  Government & military (parliament, republic, brigade,
          bureaucracy, army, kingdom, political party, senate,
          theocracy, government, jury)
      -bin  Business and academia (corporation, faculty, partnership,
          sorority, business, trust, cartel, construction company,
          affiliate, union, law firm, restaurant chain)
      -boy  Recreation (club, choir, circle)
      -be   other (clan, community, congregation, sect, team/crew,
          department, organization, parish, gang, caste, brotherhood)

Members of groups, including ranks and titles:

      -caw  Government & military (president, congressman, soldier, officer,
          cadet, astronaut, politician, nobleman, ambassador, colonel,
          duchess, policeman, judge)
      -cin  Business and academia (carpenter, musicologist, physician,
          teacher, electrician, farmer, journeyman, mathematician,
          biologist, musician, salesman, actor, linguist, plumber,
          scholar)
      -coy  Recreation (gymnast, gardener, chess player, hobbyist)
      -ce   other (person, thief, worker/laborer, prisoner, professional,
          member, student, pilot, fireman, polyglot, adult)

Professions, occupations, and fields of study or endeavor, and activities:

      -zaw  Government & military (politics, military science, lawmaking)
      -zin  Business and academia (engineering, acting/show business,
          farming, carpentry, linguistics, history, mathematics,
          plumbing, science, writing)
      -zoy  Recreation (gambling, debate, soccer, gymnastics, chess,
          gardening, hobby)
      -ze   other (divination, preaching, profession/occupation)

<span id="performances"></span> Performances, components, and attributes:

      -gwe  symbols (letter/alphabet, squiggle, note (musical), swastika,
          comma, equation, minus-sign, pi, degree/diploma, parenthesis,
          caduceus, exclamation point)
      -sen  protocols (language, creole, dialect, program, design, protocol,
          code, plan/scheme, recipe, score/music, rules/instructions)
      -zi   measures (meter, acre, gallon, gram, ton, second, century,
          radian, dollar, joule, newton, hertz, watt, ampere, ohm)
      -cay  shapes (circle, line, triangle, ellipse, hexagon, sphere, dome,
          rectangle, point, disc, polyhedron, rhombus, cylinder, sheet)
      -fun  ideologies, philosophies, and schools of thought (democracy,
          communism, behaviorism)  Note that some of these will have a
          version using "-fun" and one using "-baw".  For example,
          "democracy" can be either an ideology or a form of government.
      -jo   complete performances (poem, song, opera, symphony, novel, war,
          law, occupation/vocation/job, lecture, tournament, game,
          speech, course (academic), research, fieldwork, meal, battle)
      -xi   components or sections of a performance (stanza, scene, lap,
          movement, chapter, climax, word, morpheme, promotion/demotion,
          task/assignment/job, lesson, subroutine (computer))
      -ban  other - abstract attributes/qualities of performances and their
          components - P-s adjectives by default (legal/legality,
          rhyming/rhyme, musical/music, sovereign/sovereignty, having
          pitch/pitch, powerful/power, skillful/skill, difficult/
          difficulty, efficient/efficiency, perfect/perfection,
          complex/complexity, automatic/automation, victorious/victory,
          free/freedom, secret/secrecy, convenient/convenience,
          safe/safety, accurate/accuracy, successful/success) WARNING!:
          Be careful not to confuse this class with modal concepts.

Actions:

      -te   speech acts, default = A/P/F-d verb (tell, shout, ask, explain,
          flatter, lie, mock, offer, thank, curse, congratulate,
          recommend)
      -lo   activities, default = AP-s verb (go, smoke, eat, ski, swim,
          walk, work, study, sing, bark)
      -xwa  involuntary acts, default = P-d verb (sneeze, blink, laugh,
          trip/stumble, blush, drool, burp, hiccup, sob (P-s form means
          'weep/cry'))
      -gu   other acts, default = A/P-d verb (do something to, push, tickle,
          betray, spill, kick, throw, catch, drop, punish, drag,
          grasp/grab, pick up, put down, build, manipulate, spit on)

Scalar relational states:

        mental states, default = P/F-s verb:
      -ta     emotions & desires (fear, be angry, love, want, be happy, be
            eager, like/enjoy, be greedy, be emotional, have fun)
      -kon    other mental states (think, know, remember, be conceited,
            understand, wonder, be intent/focused on, imagine)
      -li   physical relationship, default = P/F-s verb (hear, be allergic
          to, taste, feel pain in, detect (eg. an instrument)/sense, be
          hungry for, to be/feel cold in)
      -tu   other scalar relationships, default = P/F-s open adjective
          (about/involved with, similar to, taste like, compatible with,
          ready to/for)

Scalar non-relational states, default = P-s adjective:

      -tin  states that apply only to humans/sentients (wise, friendly,
          quiet/reticent, wealthy)
      -toy  antonyms of states that apply only to humans/sentients (foolish,
          unfriendly, talkative/garrulous, poor)
      -bi   vague physical states without corresponding, commonly used,
          measure words (big, wet, sharp, strong, clean, light/lit,
          sunny, smooth, common, soft, sweet, loud)
      -zu   antonyms of vague physical states (small, dry, blunt, weak,
          dirty, dark/unlit, cloudy/overcast(?), rough, rare, hard,
          bitter, quiet)
      -xe   measurable physical states with corresponding, commonly used,
          measure words (hot, tall, heavy, thick, fast, old/aged, far,
          expensive, high, long, late)
      -fo   antonyms of measurable physical states (cold, short, light,
          thin, slow, young, near, cheap, low, short, early)
      -la   other states - subjective (good, attractive, fragrant, normal)
      -bu   antonyms of other states (bad, ugly, smelly, abnormal)

Binary relational states:

      -kin  kinship relations, default = P/F-s noun (mother, cousin,
          grandchild, uncle, brother)
      -ven  social/economic/political/etc relationships, excluding kinship,
          default = P/F-s noun (friend, colleague, acquaintance,
          employee, enemy, member, guest)
      -fay  exchange and transfer verbs, default = AP/F-d verb (buy/sell,
          borrow/lend, swap/exchange, invest in, donate, confiscate/
          commandeer, steal) [Convention: "bu-" will be used if the
          subject gains possession of the focus.  The unmarked form will
          be used if the subject loses possession of the focus.]
      -bun  arithmetic functions, default = P/F-s verb (addition, square
          root, logarithm, cosine, reciprocal, integral)
      -za   others, default = P/F-s verb (be a part/constituent of, own, be
          equal to, be an alternate for, be a substitute for, be a
          prerequisite of/for, be full of, mean/signify, provide/be the
          source of, result in)

Binary non-relational states, default = P-s adjective:

      -bye  colors (red, blue, green, turquoise, magenta, colored)
      -xo   attributes of living entities (alive, pregnant, female, sober,
          standing/upright, healthy, sitting, growing, awake,
          intelligent, intelligible)
      -xan  opposites of attributes of living entities (dead, non-pregnant,
          male, inebriated, prone/lying down, sick/ill, kneeling,
          asleep, non-intelligent, unintelligible)
      -fi   others (open, actual/existent, straight, exposed, up,
          vertical, hollow, authentic, functional/operational, natural,
          clear/transparent, colorful, apart)
      -zan  opposites of others (closed, imaginary, crooked, hidden,
          down, horizontal, solid, fake, dysfunctional/broken,
          artificial, opaque, colorless, together)
        [Concepts that do not have true opposites, such as 'written',
        'material/matter', and 'translucent', can use either of the
        two opposite classifiers.]

Deictic classifiers (all are root-terminators):

      -mi   personal pronouns (default = P-s noun)
      -poy  genitive personal pronouns (default = P-s adjective)
      -pe   demonstratives (default = P-s adjective)
      -paw  locatives (default = "0" adverb)
      -may  temporals (default = "0" adverb)

Tense classifiers (all are P/F-s root-terminators and disjuncts):

      -pa   past tense
      -pi   present tense
      -pu   future tense
      -pay  past+present tense
      -pyu  present+future tense        
      -maw  unspecified tense

Modal classifiers (all are root-terminators and disjuncts):

      -me   epistemic (default AP/F-s)
      -mo   deontic (default P/F-s)

Other root-terminators:

      -ma   true generic root (default = P-s adjective)
      -pye  true conjunctions (and, or, but, default = P/F-s true
          conjunction)
      -po   genitive/relative clause linker (F/P-s open adjective)
      -mu   numerics, (one, 7.23E-5, seventh, three-fourths,
          three-at-a-time, default = P-s adjective)
      -pyo  positive relational locatives (at/in/on, between, above, to the
          left of, north of, default = P/F-s case tag)
      -moy  antonyms of relational locatives (away from, under, to the right
          of, to the south of, default = P/F-s case tag)
      -mwa  particles (modifying semi-root indicates default)

<span id="APPENDIX_D"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## APPENDIX D: Semi-roots of the Interlingua (with modifier meanings)

Here is a list of all the semi-roots of the interlingua in alphabetical order. Each entry has three fields, separated by semi-colons, with the following format: stand-alone meaning; classifier meaning; modifier/mnemonic meanings. Note that many potential semi-roots are undefined and are reserved for future use.

      ba      spider;
                arachnids;
                web, net, catch/trap, six, white
      ban     musical;
                abstract attributes/qualities of performances and their components;
                music, melodious, singing
      baw     army;
                government & military groups;
                fight, war/combat, victory, opposition/anti-
      bawn
      bay     seal;
                sea mammals;
                flipper, clap
      bayn
      be      team;
                other groups & organizations;
                cooperation, alliance, partnership, (N per) group
      ben     brain;
                internal animal organs;
                thought, intelligence, reason/reasonable
      bi      big;
                vague scalar non-relational physical states without common measure words;
                maximal polarity, big
      bin     business;
                business & academic groups;
                money, commerce, finance, trade, greedy
      bo      chicken;
                birds - Galliformes and Anseriformes (i.e., "fowls");
                ???
      bon     ???;
                supporters;
                on (the surface of), lift, support, carry, heavy, weight
      boy     ???;
                recreational groups;
                ???
      boyn
      bu      bad;
                opposites of other scalar non-relational states;
                0% polarity, terminative, zero, black, contrast/opposition
      bun     ???;
                arithmetic functions;
                ???
      bwa     ???;
                edible root plants;
                ???
      bwan
      bwe
      bwen
      bwi
      bwin
      bya     ???;
                other devices;
                automatic, powered, mechanical, complex, technical
      byan
      bye     colored;
                colors;
                ???
      byen
      byo     vitamin;
                biochemicals;
                necessity, nutrition
      byon
      byu     nail;
                connectors;
                link/connect/bind
      byun
      ca      water;
                inorganic compounds;
                one, inceptive, liquid/fluid, wet
      can     door;
                separators;
                barrier, between, closed/blocked/obstructed
      caw     judge/magistrate;
                government & military people;
                law, legal, justice, court, litigation
      cawn
      cay     ???;
                shapes;
                ???
      cayn
      ce      person;
                other group members, ranks, & titles;
                use for any/all members of a class
      cen     kangaroo;
                mammals - Marsupialia;
                jump, punch, pouch
      cewe
      ci      sparrow;
                birds - Passeriformes (perching birds);
                about/approximately, vague/imprecise, similar/like, perch, chirp
      cin     doctor/physician;
                business and academic people;
                healthy, strong, fit/functional/operational
      co      sugar;
                processed food substance;
                sweet, candy, negative exponent
      con     crab;
                arthropods - Crustacea;
                claw, grasp, scuttle/scurry
      coy     ???;
                recreational people;
                ??? 
      coyn
      cu      lake;
                bodies of water;
                ???
      cun
      cwa
      cwan
      cwe
      cwen
      cwi
      cwin
      dan     wheel;
                other artificial items;
                turn/spin, round/circle, around
      dawn
      dayn
      den     sunshine;
                non-living energy - mass nouns;
                sun, bright, shine, happy
      din     worm;
                other animals;
                dig, tunnel
      don     ???;
                other plants;
                green
      doyn
      dun     ???;
                inorganic things;
                ???
      dwan
      dwen
      dwin
      dyan
      dyen
      dyon
      dyun
      fa      ???;
                edible parts of plants;
                ???
      fan
      faw     ???;
                other artificial locations;
                N-ary, Nth in importance, rank, or value, significant/important
      fawn
      fay     exchange/swap;
                exchange and transfer verbs;
                exchange/swap, trade, alternate/switch, replace
      fayn
      fe      ???;
                other natural locations;
                two, continuative
      fen
      fi      real/actual/existent;
                other binary non-relational states;
                reality, build/construct, engineering
      fin     gun/firearm;
                powered weapons;
                shoot/fire, explosive, noisy/loud, too/excessively/over-
      fo      young;
                opposites of measurable scalar non-relational physical states;
                low polarity, pale/dull, less/subtraction
      fon
      foy     ???;
                herbs and spices;
                ???
      foyn
      fu      food;
                artificial food items;
                eating, stomach
      fun     ???;
                ideologies, philosophies, and schools of thought;
                ???
      fwa     ???;
                amphibians;
                ???
      fwan
      fwe
      fwen
      fwi
      fwin
      fya
      fyan
      fye     ???;
                non-living energy - count nouns;
                ???
      fyen
      fyo
      fyon
      fyu     moth;
                arthropods - Lepidoptera;
                cocoon, weave, thread, silk
      fyun
      ga      mouse;
                mammals - Rodentia;
                child (either sex), innocent
      gan
      gaw     ???;
                musical instruments;
                ???
      gawn
      gay     ???;
                other natural things;
                ???
      gayn
      ge      ???;
                other artificial substances;
                sufficient, acceptable
      gea
      gen     hydrogen;
                chemical elements;
                purity, simplicity, basic/fundamental
      gi      corn;
                grains;
                three, resumptive, purple, daughter
      gin
      go      knife;
                tools, utensils, and non-powered instruments;
                fraction, X/Y, cut/incise, sharp
      gon
      goy     ant;
                ants & related species;
                ???
      goyn
      gu      do something to;
                other acts;
                son, victim, target
      gun
      gwa     ???;
                other living, natural matter & energy;
                ???
      gwan
      gwe     ???;
                symbols;
                meaning, implication, representation, alternative, acting
      gwen
      gwi     ???;
                sea birds;
                sea/ocean, marine
      gwin
      gya     store/mart/shop;
                places of business;
                retail, shopping, buy/purchase
      gyan
      gye
      gyen
      gyo
      gyon
      gyu
      gyun
      ja      ???;
                informative/artistic/entertaining/social items;
                public/social/communal, parent (either sex)
      jan
      jaw

      jawn
      jay     ???;
                points in time;
                perfective
      jayn
      je      ???;
                Osteichthyes - i.e. fishes with a bony skeleton;
                sibling (either sex)
      jea
      jen     ???;
                other food plants;
                farming
      ji      house/home;
                other buildings;
                habitual, inherent, mother/nurture/affection, reside/dwell/live
      jin     fire;
                other (non-weather) phenomena;
                hot/heat, cook, yellow
      jo      ???;
                complete performances;
                four, completive, finish/result, consequence
      jon
      joy     boat;
                water vehicles;
                float/buoyancy
      joyn
      ju      dog;
                mammals - Carnivora;
                like/enjoy, friend(ly), pet, father
      jun     ???;
                other organic compounds;
                ???
      jwa
      jwan
      jwe
      jwen
      jwi
      jwin
      kan     car/automobile;
                non-water vehicles;
                going/travel, transportation, movement, fast/quick
      kawn
      kayn
      ken     ???;
                arthropods - Coleoptera and Orthoptera;
                ???
      kin     relative;
                kinship relations;
                ???
      kon     know;
                other mental states;
                knowledge, wise/wisdom, education, professional/expert
      koyn
      kun     ???;
                periods of time;
                imperfective, long (temporal)
      kwan
      kwen
      kwin    club;
                non-powered, hand weapons;
                hit/strike, hurt/wound, pain
      kyan
      kyen
      kyon
      kyun
      la      good;
                other scalar non-relational states - human or subjective;
                average polarity, moderate
      lan
      law     ???;
                mammals - Lagomorpha;
                ???
      lawn
      lay     road;
                infrastructure;
                long (spatial)
      layn
      le      bee;
                bees & wasps;
                hive, honey, orange, hover
      len
      li      see;
                physical relationships;
                sight/vison, clear/transparent, evident
      lin     ???;
                wounds & growths;
                ???
      lo      work;
                activities;
                work/labor, employment, project/undertaking
      lon
      loy     lizard;
                other reptiles;
                decimal point, ???
      loyn
      lu      hand;
                external animal organs;
                aspectless/unspecified, five, manipulate, write, grasp/hold, touch,
      lun     ???;
                beverages;
                drink
      lwa
      lwan
      lwe
      lwen
      lwi
      lwin
      lya
      lyan
      lye
      lyen
      lyo
      lyon
      lyu
      lyun
      man     ostrich;
                birds - Struthioniformes;
                ???
      mawn
      mayn
      men     ???;
                sites or areas that typically contain more than one building;
                ???
      min
      mon     snail;
                Gastropoda;
                ???
      moyn
      mun     ???;
                fruit and nut trees;
                ???
      mwan
      mwen
      mwin
      myan
      myen
      myon
      myun
      pan     pine;
                softwood trees;
                ancestor, previous/past/earlier/pre-/ante-, sap/resin
      pawn
      payn
      pen     cup;
                containers;
                full/empty, inside, contain/cage/confine
      pin     monkey;
                mammals - primates;
                swing, chatter
      pon     ???;
                living energy (i.e., supernatural and primarily non-physical);
                ???
      poyn
      pun     ???;
                passive electrical components;
                descendent, next/future/later/post-,
      pwan
      pwen
      pwin
      pyan
      pyen
      pyon
      pyun
      san
      sawn
      sayn
      sen     language;
                protocols;
                communicate, word, comprehension
      sin     ???;
                snakes;
                ???
      son     shoe;
                items of clothing;
                foot, walk
      soyn
      sun     shark;
                Chondrichthyes - i.e. fishes with a cartilage skeleton;
                fierce/vicious
      swan
      swen
      swin
      syan
      syen
      syon
      syun
      ta      want;
                emotions & desires;
                ordinal, desire/intent/objective
      tan
      taw     ???;
                other birds;
                blue, sky, flying/airborne, high/above/up
      tawn
      tay     gutter;
                conduits;
                ???
      tayn
      te      say/tell;
                speech acts;
                speech, voice, ear, hear, sound
      ten
      ti      insect;
                other Arthropods;
                eight
      tin     ???;
                states that apply only to humans/sentients;
                humanity, sentience, civilization/society
      to      room;
                rooms;
                privacy, apart, solitary, inside/within, just/only/exclusively/simply
      ton     ???;
                weather phenomena;
                inevitable, ???
      toy     ???;
                antonyms of states that apply only to humans/sentients;
                ???
      toyn
      tu      have something to do with;
                other scalar relationships;
                numeric exponent, relationship/association
      tun
      twa     tooth;
                organic things;
                chew, mash/crush, bite
      twan
      twe     ???;
                illnesses & diseases;
                ???
      twen
      twi     clam;
                Bivalvia;
                ???
      twin
      tya
      tyan
      tye
      tyen
      tyo     bat;
                other mammals;
                night, dark, blind, echo
      tyon
      tyu
      tyun
      van
      vawn
      vayn
      ven     ???;
                social/economic/political/etc relationships;
                ???
      vin     air;
                other natural substances;
                ???
      von     sheep;
                ungulates - hooved mammals;
                grass, graze, husbandry
      voyn
      vun
      vwan
      vwen
      vwin
      vyan
      vyen
      vyon
      vyun
      xa      ???;
                other trees - broad-leaved hardwoods;
                wood, paper/cardboard, tall/vertical/standing
      xan     asleep;
                opposites of attributes of living entities;
                unconscious, inactive, non-living
      xaw
      xawa
      xawn
      xay     fly;
                insects - Diptera & Odonata;
                minus sign (default = positive)
      xayn
      xe      old;
                measurable scalar non-relational physical states;
                high polarity, deep(color), more/add, day
      xen
      xi      ???;
                components or sections of a performance;
                ???
      xin     town;
                large (typically political) divisions;
                ???
      xo      alive;
                attributes of living entities;
                nine, life/alive/living, active/energetic, ready/prepared/fit
      xon
      xoy     ???;
                other organs or body parts;
                ???
      xoyn
      xu      blood;
                plant/animal substances and mixtures;
                red
      xun
      xwa     ???;
                involuntary acts;
                surprising, unexpected, referent-switch
      xwan
      xwe     ???;
                power tools;
                iterative/repetitive
      xwen
      xwi
      xwin
      za      ???;
                other binary relational states;
                ???
      zan     not real;
                opposites of other binary non-relational states;
                counterfactual/hypothetical
      zaw     politics;
                government & military professions;
                voting/ballot, political party, platform, candidacy, precinct, partisan
      zawn
      zay     ???;
                Cephalopoda;
                almost, not quite, nearly, all but, well-nigh
      zaye

      zayn
      ze      ???;
                other professions, fields of study, & endeavors;
                seven, ???
      zen     hawk;
                Falconiformes - i.e. "birds of prey";
                prey/predator/hunt
      zi      ???;
                measurements;
                equal, exactly/precisely, authentic, unknown number marker, sister
      zin     science;
                business and academic professions;
                research, objectivity, nature/natural, the universe
      zo      ???;
                other fishes;
                swimming
      zon
      zoy     recreation;
                recreational endeavors;
                fun, game, entertainment, festivity, real/imaginary separator
      zoya
      zoyn
      zu      small;
                opposites of vague scalar non-relational physical states;
                minimal polarity, brother
      zun
      zwa
      zwan
      zwe     chair;
                furniture;
                sitting, folded, bent
      zwen
      zwi
      zwin
      zya
      zyan
      zye
      zyen
      zyo
      zyon
      zyu
      zyun

<span id="APPENDIX_E"></span>

<span class="small">\[ [Table of Contents](#toc) \]</span>

## APPENDIX E: Syntax of the Interlingua

Throughout this monograph, I have generally used English word order in my examples to make them easier for the English-speaking reader to understand. However, from the start, I have always intended the language to be purely right-branching (i.e. VSO). Right-branching languages are inherently easier to parse for both computers and humans.

Here is a complete listing of the production rules and general rules of the interlingua:

Production rules:

      |  = logical 'or'
      () = enclosed item is optional
      {} = enclosed item may appear zero or more times

      sentence ::= (topic) (interrogative) clause | vocative-noun-phrase 

      topic ::= topic-particle argument

      topic-particle ::=
          heavy-topicalization-particle | reference-switching-particle

      clause ::= {disjunct} verb {argument} (valency-terminator)

      argument ::= core-argument | oblique-argument

      core-argument ::= expression

      oblique-argument ::= adverb | case-tag expression

      expression ::= noun-phrase | clause

      noun-phrase ::= noun (noun-modifier)
                    | open-noun (noun-modifier) expression

      noun-modifier ::= {light-modifier | heavy-modifier}

      light-modifier ::= adjective

      heavy-modifier ::= open-adjective expression

General rules:

      Previous-word Modifier Rule:

        Any word except a conjunction or a delimiting particle may be
        immediately followed by a previous-word modifier (pwm).  Here is
        the syntax:

        pwm ::=
            {light-previous-word-modifier | heavy-previous-word-modifier}

        light-previous-word-modifier ::= previous-word-modifier

        heavy-previous-word-modifier ::=
            open-previous-word-modifier expression

        The scope of a pwm will be the preceding word plus any of the
        arguments or modifiers of the preceding word (i.e., the pwm
        immediately follows the headword of the item that it applies
        to).

      Coordination Rule:

        For the purpose of coordination, the following are considered
        "constituents": sentence, clause, noun phrase, heavy-modifier,
        adjective, adverb/case tag, and pwm.

        Any constituent "X" may be replaced by a coordinated constituent
        "X" of the same type, as follows:

            X  ::=  (coordination-initiator)
                X {coordinating-conjunction X}
                (coordination-terminator)

        Note that explicit coordination of adjectives using the word
        meaning 'and' is allowed and has the same meaning whether or not
        'and' is used.  For example, both "dog big black", "dog black
        big", and "dog black and big" are all equivalent to English "big
        black dog".  Similarly, "house red green" means 'the green and
        red house'.

        It is not possible for disjuncts to be coordinated, although
        more than one may occur in sequence.  This restriction must
        exist to prevent a constituent from having two or more heads.
        For the same reason, verbs also cannot be coordinated (e.g. "*He
        washed and polished the car."), although entire clauses
        may be coordinated (e.g. "He washed the car and he
        polished it.").

      Parsing Rule:

        When one constituent is embedded inside another, the parser will
        not exit the current level of embedding until all syntactically
        acceptable constituents have been parsed; i.e., it will leave
        its current level only when it encounters a constituent that
        violates the syntax for the current level.  The semantics of the
        construction will never be a consideration.  For example, in a
        sentence such as "verb1 noun verb2 noun oblique1 oblique2", both
        oblique arguments are arguments of verb2.  Since there will be
        cases in which it is necessary to prematurely terminate the
        argument structure of an embedded verb, we will need a particle
        to perform this function.  In the interlingua, we will use
        "tawmwa" for this purpose, and refer to it as a valency
        terminator.  For example, in "verb1 noun verb2 noun
        oblique1 tawmwa oblique2", "oblique1" is an argument of "verb2"
        while "oblique2" is an argument of "verb1".

        Similarly, if there are more core arguments present than are
        allowed by the argument structure of the verb, then parsing at
        that level will stop and the additional arguments will be
        available at the higher level.  For example, in "verb1 verb2
        noun1 adverb1 noun2", if "verb2" is P-d, then both "noun1" and
        "adverb1" are arguments of "verb2", while "noun2" must be an
        argument of "verb1".  Again, use of the valency terminator
        "tawmwa" can override the default parse.

The End
