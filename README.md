# flownotes
A XeLaTex template for writing notes.

version 0.1

# general philosophy
This template is essentially a digital version of the on-paper note-taking method that I have been using for years. I only use this method for heavy-knowledge-related purposes. For other purposes, I guess any notebook app today will do the work.

The note-taking philosophy is:
* **All-in-one**: applicable for most heavy-knowledge-related puporses: academic notes at school, technical notes at work, notes for personal hobbies/skills, notes for elaborated inspirations; you don't have to used different notebooks for different purposes
* **Flexibility**: notes for the same topic can be shattered at different places, and yet it is easy to review all of them;
* **Easy to recall**: for example, to have clear date records (people usually are good at recalling dates of their own activities, thus make recalling a note easier);
* **Effectiveness for self-education**:
  - **Problem-oriented learning**: learn by solving problems or answering questions;
  - **Concept-oriented learning**: learn by understanding key concepts with definitions and examples 
  - **Interest-oriented learning**: learn the parts of the knowledge that you are most interested in first;
  - **Cognition-oriented learning**: learn by recording your own cognitive flow: write down exactly what you have in mind;
  - **System-oriented learning**: learn by organizing knowledge into a coherent systematic structure.

 Volunteering contributors are welcomed as long as the above philosophy is followed.

# features
* every note is put into a box with a label that shows the topic, date, the ordinal number of the note about the topic on that data. (formatting example: Music#2019100201)
* arrows to connect text bodies
* q&a boxes to facilitate problem-oriented learning
* beautiful typesetting for both Latin-letter-based languages (e.g., English, French, etc.) and CJK-character-based languages (e.g., Simplified Chinese, Traditional Chinese, Japanese, Korean)

# more features to come in the future
* single commands for flow charts, layer models, etc.
* typsetting for Arabic, Hebrew, etc.
* more free styles of arrow drawing to connect texts.
...

# Usage and example
First, clone the project:

    $ git clone https://github.com/eugene-yh/flownotes.git

Then, download fonts from [here](https://drive.google.com/file/d/1E5KRONs4xPmC0HXqNc_GINk_RUqor9Pg/view?usp=sharing) or [here](https://pan.baidu.com/s/1QDR_wqdsLmmfQ863HPG5tQ) (psw: qigd). Decompress the file and put the `fonts` directory under the main directory.
Run the following commands to compile the documentation:
    
    $ cd flownotes
    $ xelatex doc
    $ bibtex doc
    $ xelatex doc
    $ xelatex doc    

The documentation is written in a note form, thus it can also serve as an example of this template.
