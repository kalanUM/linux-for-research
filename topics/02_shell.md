@title[Shell Environment and the CLI]
### **Shell Environment and the CLI**

### Interacting with files & the shell 

...no more Git, <!-- .element: class="fragment" -->

<br/>
after this one more Git... <!-- .element: class="fragment" -->




---?image=null.jpg&color=orange
@title[Exercise:  check git status ]
@transition[none]
@snap[north-west]
<h4>Exercise:  check git status </h4> 
@snapend


```
(master)$ git status
On branch master
nothing to commit, working tree clean
```

- We should have a clean working tree, after the last `git commit`
- If not, investigate `git status` for clues <br/>
or re-clone the repository:

<br/>
`git clone https://github.com/ccs-training/linux-for-research.git`

[comment]: # (-----------------------EXERCISE--------------------------------) 






---
@title[Interacting with text files -- CLI]
@transition[none]
@snap[north-west]
<h4>Interacting with text files in the CLI</h4> 
@snapend

Not all pantry ingredients should be opened right away:
- ghost pepper powder
- compressed dough 
- ..stuff with mold on it 

See what information we can get by reading **containers** & **labels**.   


@snap[south]
@size[0.7em](skip ls & file @fa[arrow-right])
@snapend


+++?image=null.jpg&color=orange
@title[Exercise:  file details, size -- ls]
@transition[none]
@snap[north-west]
<h4>Exercise:  file details, size -- ls</h4> 
@snapend


`ls -lh` to view detailed file information, with nice sizes  

```
$ ls -lh pie.sh U.[TAB]
$ ls -lh pie.sh U.S._Chronic_Disease_Indicators__CDI_mod.csv 
-rwxrwxrwx. 1 634 Mar 16 08:28 pie.sh
-rwxrwxrwx. 1 44M Mar 16 08:28 U.S._Chronic_Disease_Indicators__CDI_mod.csv
```

2 targets (files) provided to `ls -lh` command 


Note:

Recall Bash's TAB-completion feature

[comment]: # (-----------------------EXERCISE--------------------------------) 


+++?image=null.jpg&color=orange
@title[Exercise:  file details, type -- file]
@transition[none]
@snap[north-west]
<h4>Exercise:  file details, type -- file</h4> 
@snapend


```
$ file pie.sh U.S._Chronic_Disease_Indicators__CDI_mod.csv
pie.sh:                                       Bourne-Again shell script, ASCII text executable
U.S._Chronic_Disease_Indicators__CDI_mod.csv: ASCII text, with very long lines
```

[comment]: # (-----------------------EXERCISE--------------------------------) 



---
@title[Interacting with text files -- cat, head, & tail]
@transition[none]
@snap[north-west]
<h4>Interacting with text files -- cat, head, & tail</h4> 
@snapend 

- `pie.sh` is 634 bytes (small enough for the screen)
- `U.S._Chronic...` is 44 **MB** (too large for the screen)

<br/>
Fortunately, shells come with different programs to view contents.  

@snap[south]
@size[0.7em](skip cat, head, & tail @fa[arrow-right])
@snapend


+++?image=null.jpg&color=orange
@title[Exercise:  cat - for smaller files]
@transition[none]
@snap[north-west]
<h4>Exercise:  cat - for smaller files </h4> 
@snapend

```
$ cat pie.sh
#!/bin/bash 

# Pie ASCII printer
#
#             (
#              )
#         __,.---.,__
#     ,-=`  /  |  \  `=-.
#    :--.,___________,.--;
#     \.,_____________,./ 
..
```

[comment]: # (-----------------------EXERCISE--------------------------------) 





+++?image=null.jpg&color=orange
@title[Exercise:  head & tail - for larger files]
@transition[none]
@snap[north-west]
<h4>Exercise:  head & tail -- for larger files </h4> 
@snapend

```
$ head U.S._Chronic_Disease_Indicators__CDI_mod.csv 
YearStart,YearEnd,LocationAbbr,LocationDesc,DataSource,Topic,..
2013,2013,AK,Alaska,YRBSS,Alcohol,Alcohol use among youth,%,Crude..
Prevalence,22.5,22.5,,,19.3,26.1,Overall,Overall,"(64.84507995700051, -147
...
$ tail U.S._Chronic_Disease_Indicators__CDI_mod.csv
...
```


Note:

Use `head` to view the first 10 lines,

`tail` to view the last 10 lines 

`tail --help` & `man head` for **command** & parameter information 


+++?image=null.jpg&color=orange
@title[Exercise:  specify lines with -- head -n]
@transition[none]
@snap[north-west]
<h4>Exercise:  specify lines with -- head -n</h4> 
@snapend

Get first line only, CSV headers 

```
$ head -n 1 U.[TAB]
YearStart,YearEnd,LocationAbbr,LocationDesc,DataSource,Topic,..
```

[comment]: # (-----------------------EXERCISE--------------------------------) 




---?image=null.jpg&color=orange
@title[Exercise:  pagers -- less]
@transition[none]
@snap[north-west]
<h4>Exercise:  pagers -- less</h4> 
@snapend

To view the contents of a large CSV file, use a pager

```
$ less U.S._Chronic_Disease_Indicators__CDI_mod.csv 
..
q to quit pagers 
```

- `q` on keyboard to quit pager programs 
- " **less** is _more_ "
  - `less` is a more powerful version of `more` 



[comment]: # (-----------------------EXERCISE--------------------------------) 





---?image=null.jpg&color=orange
@title[Exercise:  check pies]
@transition[none]
@snap[north-west]
<h4>Exercise:  check pies</h4> 
@snapend

Run `pie.sh` and `pie2.sh` again, and compare outputs.

@snap[south]
@size[0.7em](skip text editing @fa[arrow-right])
@snapend



+++
@title[Editing text -- fix modular pie]
@transition[none]
@snap[north-west]
<h4>Editing text -- fix modular pie</h4> 
@snapend

- `pie2.sh` 
  - has extra blank lines
  - is modular 

- `cat pie2.sh` to look for any exta `echo`s
 - none
 - investigate the modular scripts 


Note:

If you have a `pie/` folder, rename it:

```
$ mv pie/ pie_modules/
```




+++
@title[Editing text -- fix modular pie]
@transition[none]
@snap[north-west]
<h4>Editing text -- fix modular pie</h4> 
@snapend

Navigate to the `pie_modules` folder & `ls` 

```
$ cd pie_modules
pie_modules](master)$ ls
base.sh  crust.sh  steam.sh
```




+++?image=null.jpg&color=orange
@title[Exercise:  cat small scripts]
@transition[none]
@snap[north-west]
<h4>Exercise:  cat small scripts</h4> 
@snapend

`cat` some scripts 

```
$ cat base.sh
#!/bin/bash 

# Pie ASCII printer
..

echo
echo "$BASE1"
echo "$BASE2"
```

Looks like an extra `echo` on top is making pie spaces. <br/>
We can edit it out. 





+++
@title[Editing text files -- nano]
@transition[none]
@snap[north-west]
<h4>Editing text files -- nano</h4> 
@snapend

The `nano` text editor is included in most shells (including newer GitBash versions).

- Advantages of `nano`:
  - light-weight
  - visible control hints 
  - immediate editing 




+++?image=null.jpg&color=orange
@title[Exercise:  edit with nano]
@transition[none]
@snap[north-west]
<h4>Exercise:  edit with nano</h4> 
@snapend

Edit `base.sh` & remove the top "echo"

```
$ nano base.sh
```

- arrow keys to "echo"
- delete (with keyboard)

- `CTRL-O` (letter O), `ENTER` to save
- `CTRL-X` to exit

Or `CTRL-X`, then `Y` to save, then `ENTER` to exit


[comment]: # (-----------------------EXERCISE--------------------------------) 



+++?image=null.jpg&color=orange
@title[Exercise:  edit with nano]
@transition[none]
@snap[north-west]
<h4>Exercise:  edit with nano</h4> 
@snapend

Remove the top "echo" from the other files 

```
$ nano crust.sh
..
$ nano steam.sh
```



+++?image=null.jpg&color=orange
@title[Exercise:  edit with nano]
@transition[none]
@snap[north-west]
<h4>Exercise:  edit with nano</h4> 
@snapend

`cd` up one directory & run `pie2.sh` again 

```
$ cd ..
linux-for-research]$ . pie2.sh

             (
              )
         __,.---.,__
     ,-='  /  |  \  '=-.
    :--.,___________,.--;
     \.,_____________,./ 
```






---
@title[File stats -- wc, file]
@transition[none]
@snap[north-west]
<h4>File stats -- wc, file</h4> 
@snapend


What about descriptive stats for text files?

<br/>
```
$ wc pie.sh
 37  82 634 pie.sh
$ file pie.sh
pie.sh: Bourne-Again shell script, ASCII text executable
```

- 37 lines, 82 words, and 634 bytes (or "characters") 
- ASCII, encoded in 8 bits -- thus bytes = characters

@snap[south]
@size[0.7em](skip file stats @fa[arrow-right])
@snapend


+++
@title[File stats -- bytes & characters]
@transition[none]
@snap[north-west]
<h4>File stats -- bytes & characters</h4> 
@snapend

- "byte" & "character" may differ by file encoding
- "bytes = characters" **if** all characters require only 1 octet (8 bits) to encode 
- check **characters** with `wc -m pie.sh`

or check all (line, word, byte, char)
```
$ wc -lwcm pie.sh
 37  82 634 634 pie.sh
```

@size[0.8em](`wc` "char" flag is `-m` & "byte" is `-c`)



+++?image=null.jpg&color=orange
@title[Exercise:  wc -l -- for lines]
@transition[none]
@snap[north-west]
<h4>Exercise:  wc -l -- for lines</h4> 
@snapend

To show only the lines, use the `-l` flag:

```
$ wc -l pie.sh U.[TAB]
      37 pie.sh
  160268 U.S._Chronic_Disease_Indicators__CDI_mod.csv
  160305 total
```

`wc` outputs a total row, when provided multiple arguments 

[comment]: # (-----------------------EXERCISE--------------------------------) 




+++
@title[Shell command syntax -- all files]
@transition[none]
@snap[north-west]
<h4>Shell command syntax -- all files</h4> 
@snapend

What about line counts for **all** the files in our _workspace_?

- Try `wc -l [ENTER]` & fail --
- `wc` command doesn't work the same way as `ls`  

There is another way...




---
@title[Shell globbing -- for multiple files]
@transition[none]
@snap[north-west]
<h4>Shell globbing -- for multiple files</h4> 
@snapend

- Bash performs special character _expansion_, called "globbing"
- To count the lines in every file, 
  - pass an asterisk `*` to `wc -l` 
  - as the _argument_ 

- **The shell** will expand `*` to all the files in the folder.

@snap[south]
@size[0.7em](skip globbing @fa[arrow-right])
@snapend


Note:

the `wc` program prints a message to the screen about directories, which have 0 lines 





+++?image=null.jpg&color=orange
@title[Exercise:  Bash globbing]
@transition[none]
@snap[north-west]
<h4>Exercise:  Bash globbing</h4> 
@snapend

```
$ wc -l *
wc: cdc_cdi_definitions: Is a directory
       0 cdc_cdi_definitions
...
```

- the asterisk ` * ` represents zero or more characters 
- the question mark ` ? ` represents 1 character  


[comment]: # (-----------------------EXERCISE--------------------------------) 




---?image=null.jpg&color=navy
@title[Shell Feature -- globbing]
@transition[none]
@snap[north-west]
<h4>Shell Feature -- globbing</h4> 
@snapend

- the asterisk ` * ` represents zero or more characters 
- the question mark ` ? ` represents 1 character, specifically 

For more on globbing, see online Linux manual pages:

- `http://man7.org/linux/man-pages/man7/glob.7.html`  
- `http://tldp.org/LDP/abs/html/globbingref.html`  




---
@title[Shell commands -- IO redirection]
@transition[none]
@snap[north-west]
<h4>Shell commands -- IO redirection</h4> 
@snapend

Use **IO redirection** to send output:
- to another command using pipe ` | `
- to a file using:
  - overwrite ` > `
  - append ` >> ` (end)

  
@snap[south]
@size[0.7em](skip IO redirection @fa[arrow-right])
@snapend


Note:

`>` right angle bracket, "greater-than" sign 



+++
@title[Interacting with text files -- IO file]
@transition[none]
@snap[north-west]
<h4>IO redirection -- to file</h4> 
@snapend

The first row of a CSV file is typically the header row.  

Use _redirection_ to save this information to a new file. 






+++?image=null.jpg&color=orange
@title[Exercise:  redirection -- `>` ]
@transition[none]
@snap[north-west]
<h4>Exercise:  redirection -- `>`</h4> 
@snapend

Save the header row as a separate CSV file

```
$ head -n 1 U.[TAB] > headers.csv
$ cat headers.csv
YearStart,YearEnd,LocationAbbr,LocationDesc,..
```

@fa[arrow-down]


+++?image=null.jpg&color=orange
@title[Exercise:  examine headers.csv ]
@transition[none]
@snap[north-west]
<h4>Exercise:  examine headers.csv </h4> 
@snapend


```
$ file headers.csv
headers.csv: ASCII text, with very long lines
$ wc headers.csv
  1   1 345 headers.csv
$ cat headers.csv
YearStart,YearEnd,LocationAbbr,LocationDesc,..
```

[comment]: # (-----------------------EXERCISE--------------------------------) 
 
 
 
  
+++
@title[Command sequences -- IO redirection, pipes]
@transition[none]
@snap[north-west]
<h4>Command sequence chains -- pipes</h4> 
@snapend

Multiple commands can be sequenced using **pipes** ` | `

<br/>
#### IO redirection 

- The output of `wc -l *` is in order of shell expansion.  
- Send it to `sort` with a **pipe**
  - `sort` output will then go to the screen 





---?image=null.jpg&color=orange
@title[Exercise:  IO redirection -- pipe]
@transition[none]
@snap[north-west]
<h4>Exercise:  IO redirection -- pipe</h4> 
@snapend 

```
$ wc -l * | sort
wc: cdc_cdi_definitions: Is a directory
wc: cdc_cdi_desc: Is a directory
..
  160268 U.S._Chronic_Disease_Indicators__CDI_mod.csv
  160452 total
```

- Directories are on top & file line counts are sorted 
- `wc` on directories produces **stderr** messages 



---?image=null.jpg&color=green
@title[Shell commands -- sort]
@transition[none]
@snap[north-west]
<h4>Shell commands -- sort</h4> 
@snapend 

- `sort -r` -- to reverse sort
- `sort -n` -- to sort _numerically_

- `sort -nr` -- both in one 

[comment]: # (-----------------------DEFINITIONS------------------------------) 





---
@title[Information Streams -- redirection]
@transition[none]
@snap[north-west]
<h4>Information Streams -- redirection</h4> 
@snapend 

- the default output is stream `1` - **stdout**: ` > `
- to redirect **stderr** instead, specify stream `2` before the `>` operator:  ` 2> `

- To redirect both:  `2>&1 >` 
  - redirect **stderr** to _same as output_ 
  - then redirect **stdout** to file
  - or ***pipe*** to another command:  `2>&1 |`





---?image=null.jpg&color=orange
@title[Exercise:  IO redirection -- error]
@transition[none]
@snap[north-west]
<h4>Exercise:  IO redirection -- error</h4> 
@snapend   

Redirect _error_ to a **file** (overwrite) 

```
$ wc -l * 2> wc_errors.txt
       0 cdc_cdi_definitions
       0 cdc_cdi_desc
..
  160415 total

$ cat wc_errors.txt
wc: cdc_cdi_definitions: Is a directory
wc: cdc_cdi_desc: Is a directory
..
```

<br/>
@size[0.8em](**stdout** still goes to the screen)

[comment]: # (-----------------------EXERCISE--------------------------------) 






---?image=null.jpg&color=green
@title[Definitions -- IO Redirection]
@transition[none]
@snap[north-west]
<h4>Definitions -- IO Redirection</h4> 
@snapend  

- `>` redirect _output_ to a **file** (overwrite) 
- `>>` redirect _output_ to a **file** (append) 

- `|` pass _output_ of a command as _input_ to another command 

- `2>` redirect _error_ to a **file** (overwrite)

- `<` redirect standard input _from a file_ 


[comment]: # (-----------------------DEFINITIONS------------------------------) 

 



---
@title[Interacting with text files -- CSV]
@transition[none]
@snap[north-west]
<h4>Interacting with text files -- CSV</h4> 
@snapend   

`wc` can show the number of rows in CSV files

- Can `wc` be used to show columns?

**Yes** -- with some help.  


---
@title[Chaining sequences of commands -- pipes] 
@transition[none]
@snap[north-west]
<h4>Chaining sequences of commands -- pipes</h4> 
@snapend 

`wc` uses spaces to count words,  
but CSV headers use commas to separate them:

```
$ wc headers.csv
  1   1 345 headers.csv
```

---
@title[Interacting with text files - translate -- tr]
@transition[none]
@snap[north-west]
<h4>Interacting with text files - translate -- tr</h4> 
@snapend

How can we turn `header.csv` into a list?

- Modern shells come with a variety of text utilities 
- like `tr`, translate 




---
@title[Interacting with text files - tr]
@transition[none]
@snap[north-west]
<h4>Interacting with text files - tr</h4> 
@snapend

`tr` translates characters, including interpreted sequence `\n` 

- `\n` is a newline character 
- changing CSV commas to `\n` produces a list 

<br/>
More on Escape Characters: <br/>
http://tldp.org/LDP/abs/html/escapingsection.html






---?image=null.jpg&color=orange
@title[Exercise:  translate -- tr]
@transition[none]
@snap[north-west]
<h4>Exercise:  translate -- tr</h4> 
@snapend

```
$ tr --help
Usage: tr [OPTION]... SET1 [SET2]
Translate, squeeze, and/or delete characters from standard input,
writing to standard output.
..
```
@fa[arrow-down]


Note:

`man tr` or `tr --help`

Use `tr` to translate, squeeze (delete repeats), and delete.  
Translate works on the entire input stream, not just the first occurrence of the character. 

[comment]: # (-----------------------EXERCISE--------------------------------) 





+++?image=null.jpg&color=orange
@title[Exercise:  tr -- building syntax]
@transition[none]
@snap[north-west]
<h4>Exercise:  tr -- building syntax</h4> 
@snapend

**Pipe** ` | ` the output of `head` to `tr` with empty sets 

```
$ head -n 1 U.[TAB] | tr '' ''
YearStart,YearEnd,LocationAbbr,LocationDesc,DataSource...
```

This confirms `tr` at least _receives_ the output of our `head` command (from the pipe).


+++?image=null.jpg&color=orange
@title[Exercise:  tr errors]
@transition[none]
@snap[north-west]
<h4>Exercise:  tr errors</h4> 
@snapend

`tr` also shows helpful errors, if we don't provide sets:

```
$ head -n 1 U.[TAB] | tr 
tr: missing operand
Try 'tr --help' for more information.
$ head -n 1 U.[TAB] | tr ''
tr: missing operand after ‘’
Two strings must be given when translating.
Try 'tr --help' for more information.
```


+++?image=null.jpg&color=orange
@title[Exercise:  tr set test]
@transition[none]
@snap[north-west]
<h4>Exercise:  tr set test</h4> 
@snapend

Fill in `tr` translation characters, using a `[space]` 

```
$ head -n 1 U.[TAB] | tr ',' ' '
YearStart YearEnd LocationAbbr LocationDesc DataSource ...
```

@size[0.8em](double-quotes would also work here) 

[comment]: # (-----------------------EXERCISE--------------------------------) 




---?image=null.jpg&color=orange
@title[Exercise:  tr & wc -- CSV cols]
@transition[none]
@snap[north-west]
<h4>Exercise:  tr & wc -- CSV cols</h4> 
@snapend

After this translation, `wc` can tokenise using spaces 

```
$ head -n 1 U.[TAB] | tr ',' ' ' | wc
      1      24     345
$ head -n 1 U.[TAB] | tr ',' ' ' | wc -w
24
```

The CDC CSV file has 24 fields, based on the header row's words.  


+++?image=null.jpg&color=orange
@title[Exercise:  tr with escaped character]
@transition[none]
@snap[north-west]
<h4>Exercise:  tr with escaped character</h4> 
@snapend

Fill in `tr`, using Escaped Character `\n` for newline 

```
$ head -n 1 U.[TAB] | tr ',' '\n'
YearStart
YearEnd
LocationAbbr
LocationDesc
..
```

Looks like a list! 


Note:

double-quotes would also work -- both interpret escape sequences 

Single-quotes `' '` only interpret **escapes** -- the backslash ` \ `
Double-quotes expand & interpret backslash ` \ `, dollar sign `$` and grave accent `` \` `` (backtick)

[comment]: # (-----------------------EXERCISE--------------------------------) 





+++?image=null.jpg&color=orange
@title[Exercise:  tr & wc -- list]
@transition[none]
@snap[north-west]
<h4>Exercise:  tr & wc -- list</h4> 
@snapend

Now we use `wc -l` for the CSV field count...

```
$ head -n 1 U.[TAB] | tr ',' '\n' | wc -l
24
```

@fa[arrow-right]



---?image=null.jpg&color=orange
@title[Exercise:  tr output to file]
@transition[none]
@snap[north-west]
<h4>Exercise:  tr output to file</h4> 
@snapend


...and redirect the header list to a new file 

```
$ head -n 1 U.[TAB] | tr ',' '\n' > headers.list
$ ls head*
headers.count  headers.csv  headers.list
```

[comment]: # (-----------------------EXERCISE--------------------------------) 





---?image=null.jpg&color=green
@title[Input streams, character sets, & tr]
@transition[none]
@snap[north-west]
<h4>Input streams, character sets, & tr</h4> 
@snapend

- `tr` accepts a live input stream (similar to `cat`)
- `tr` also accepts character sets `[ ]`, including **interpreted sequences**
  - `[:upper:]`
  - `[:lower:]`

`tr --help` or `man tr` for more sequences 



+++?image=null.jpg&color=orange
@title[Exercise:  tr character sets]
@transition[none]
@snap[north-west]
<h4>Exercise:  tr character set</h4> 
@snapend

```
$ tr [:upper:] [:lower:]
This Sentence Will Become All Lower-Case [ENTER]
this sentence will become all lower-case
[CTRL-C]

$ tr A-Z a-z
So Will This One
so will this one
[CTRL-C]
```

[comment]: # (-----------------------EXERCISE--------------------------------) 






---?image=null.jpg&color=orange
@title[Exercise:  number lines with cat]
@transition[none]
@snap[north-west]
<h4>Exercise:  number lines with cat</h4> 
@snapend

```
$ cat -n headers.list
     1  YearStart
     2  YearEnd
...
    24  StratificationID1
$ cat -n headers.list > header_col_nums.txt
$ ls head*
header_col_nums.txt  headers.count  headers.csv  headers.list
```

@size[0.8em](Without an intermediate file:)

`head -n 1 U.[TAB] | tr ',' '\n' | cat -n > header_col_nums.txt`


[comment]: # (-----------------------EXERCISE--------------------------------) 





---?image=null.jpg&color=orange
@title[Exercise:  wc globbing]
@transition[none]
@snap[north-west]
<h4>Exercise:  wc globbing</h4> 
@snapend


Count the lines in all files that begin with "head"

```
$ wc -l head*
  24 header_col_nums.txt
   1 headers.count
   1 headers.csv
  24 headers.list
  50 total
```

[comment]: # (-----------------------EXERCISE--------------------------------) 




---?image=null.jpg&color=orange
@title[Exercise:  sort & pipe]
@transition[none]
@snap[north-west]
<h4>Exercise:  sort & pipe</h4> 
@snapend

Pipe output to `sort -n`, to put smallest on top 

```
$ $ wc -l head* | sort -n
   1 headers.csv
  24 header.list
  24 header_col_nums.txt
  49 total
```

[comment]: # (-----------------------EXERCISE--------------------------------) 







---?image=null.jpg&color=green
@title[Commands - File Contents]
@transition[none]
@snap[north-west]
<h4>Commands - File Contents</h4> 
@snapend

- `cat` output entire file(s) contents, sequentially 
  - `cat -n` also number output lines 
- `head` output first 10 lines of file(s)
  - `head -n X` output first X lines 
- `tail` output last 10 lines of file(s)
  - `tail -n X` output last X lines 
  
- `less` view (& search) file contents _by page_ 

[comment]: # (-----------------------DEFINITIONS------------------------------) 


---?image=null.jpg&color=green
@title[Commands - File Stats]
@transition[none]
@snap[north-west]
<h4>Commands - File Stats</h4> 
@snapend

- `wc` print line, word, & byte counts for each input 
  - `wc -l` for only lines 
  - `wc -m` for only words (separated by spaces) 

- `sort` output sorted contents of all input(s) 
  - `sort -r` for reverse 
  - `sort -nr` for numerical sort, reverse 
  
[comment]: # (-----------------------DEFINITIONS------------------------------) 






---?image=null.jpg&color=green
@title[Definitions -- IO Redirection Operations]
@transition[none]
@snap[north-west]
<h4>Definitions -- IO Redirection Operations</h4> 
@snapend

- `>` redirect _output_ to a **file** (overwrite) 
  - `2>` redirect _error_ to a **file** (overwrite) 
- `>>` redirect _output_ (append) 
  - `2>>` redirect _error_ (append) 

---?image=assets/bg_images/green_moon.jpg
@title[Definitions -- IO Redirection Operations]
@transition[none]
@snap[north-west]
<h4>Definitions -- IO Redirection Operations</h4> 
@snapend

- `<` redirect standard input _from a file_ 

- `|` pass _output_ of a command as _input_ to another command 

- `2>&1 |` redirect _error_ to _output_, then pass as _input_ to another command 


[comment]: # (-----------------------DEFINITIONS------------------------------) 

 




---?image=null.jpg&color=green
@title[Definitions:  Shell Globbing - Filename Expansion]
@transition[none]
@snap[north-west]
<h4>Definitions:  Shell Globbing - Filename Expansion</h4> 
@snapend

- `*` zero or more characters
  - example:  `ls a*.txt` 
  - lists files that start with `a` 
  - and end in `.txt` 

---?image=null.jpg&color=green
@title[Definitions:  Shell Globbing - Filename Expansion]
@transition[none]
@snap[north-west]
<h4>Definitions:  Shell Globbing - Filename Expansion</h4> 
@snapend

- `?` single character
  - example: `ls a?.txt` 
  - lists files that start with `a`
  - have only 1 character after `a`
  - and end in `.txt`


Note:

**Globbing** cannot reliably match hidden `.` files, or files with special characters like `*` and `?` in their names.  

[comment]: # (-----------------------DEFINITIONS------------------------------) 









---
@title[File Operations -- mkdir, mv]
@transition[none]
@snap[north-west]
<h4>File Operations -- mkdir, mv</h4> 
@snapend

These `header` files look like they belong together.  

Make a new directory for them, then move them into it.  

---
@title[File Operations -- mkdir, mv]
@transition[none]
@snap[north-west]
<h4>File Operations -- mkdir, mv</h4> 
@snapend

To **move** (relocate) files with the `mv` command: 
  - the last argument (the target) must be a _directory_ (not a file) 
  - use the `-v` option (verbose) to show file system operations 

  
  
  

---?image=null.jpg&color=orange
@title[Exercise:  mkdir, mv]
@transition[none]
@snap[north-west]
<h4>Exercise:  mkdir, mv</h4> 
@snapend

```
$ mkdir cdc_columns
$ mv -v head* cdc_columns/
'header_col_nums.txt' -> 'cdc_columns/header_col_nums.txt'
'headers.count' -> 'cdc_columns/headers.count'
'headers.csv' -> 'cdc_columns/headers.csv'
'headers.list' -> 'cdc_columns/headers.list'

$ ls cdc_columns
header_col_nums.txt  headers.count  headers.csv  headers.list
```


Note:

Running `ls` after filesystem operations is a good habit to develop 

[comment]: # (-----------------------EXERCISE--------------------------------) 





---
@title[File Operations -- mv errors]
@transition[none]
@snap[north-west]
<h4>File Operations -- mv errors</h4> 
@snapend 

- When `mv` has more than 1 _source_ (and the last argument is **not** a directory)
- `mv` will **do nothing** to the _source_ arguments (and produce an error)
- Specifying more than one file, or one directory, as _source_ will produce different errors.


+++?image=null.jpg&color=orange
@title[Exercise:  mv errors]
@transition[none]
@snap[north-west]
<h4>Exercise:  mv errors</h4> 
@snapend

```
$ echo "This is a text file not a directory" > cdc_cols
$ mv cdc_columns/ cdc_cols
mv: cannot overwrite non-directory 'cdc_cols' with directory 'cdc_columns/'
```


Note:

Similar to the globbing asterisk `*`, Bash expands _directories_ like `cdc_columns/` into their contents (multiple files).


+++?image=null.jpg&color=orange
@title[Exercise:  mv errors]
@transition[none]
@snap[north-west]
<h4>Exercise:  mv errors, multiple files to file</h4> 
@snapend

```
$ mv cdc_columns/ pie.sh cdc_cols
mv: target 'cdc_cols' is not a directory
$ file cdc_cols
cdc_cols: ASCII text
```


Note:

`mv` cannot relocate multiple _sources_ to an individual file _destination_ 

[comment]: # (-----------------------EXERCISE--------------------------------) 



---?image=null.jpg&color=orange
@title[Exercise:  mv directory -- mv]
@transition[none]
@snap[north-west]
<h4>Exercise:  mv directory -- mv</h4> 
@snapend

Move the `cdc_columns` directory (& contents) to the `cdc_cdi_desc` folder

```
$ mv -v cdc_columns/ cdc_cdi_desc/
'cdc_columns/' -> 'cdc_cdi_desc/cdc_columns'

$ ls cdc_cdi_desc
cdc_columns/  ftables/  meta/
```

This folder already has some descriptive stats.

Note:

`rm cdc_cols` (the file) 

[comment]: # (-----------------------EXERCISE--------------------------------) 








---?image=null.jpg&color=blue
@title[File Operations -- Permanence]
@transition[none]
@snap[north-west]
<h4>File Operations -- Permanence</h4> 
@snapend

### File Operation Permanence Reminder

**File operations** performed by Shells are ***permanent*** 







---
@title[Filtering output -- patterns - grep]
@transition[none]
@snap[north-west]
<h4>Filtering output -- patterns - grep</h4> 
@snapend

Use `grep` to search for patterns 

`grep` is a pattern matching **command** (& program):
- searches by line 
- outputs entire matching line (by default) 
- accepts patterns called **Regular Expressions**







---?image=null.jpg&color=orange
@title[Exercise:  command sequences -- pipes]
@transition[none]
@snap[north-west]
<h4>Exercise:  command sequences -- pipes</h4> 
@snapend

Use `grep` to search input for patterns 

```
$ cd cdc_cdi_desc/meta
meta]$ wc -l * | sort -n | grep "data"

meta]$ wc -l * | sort -n | grep "Data"
   9 col_08_DataValueUnit_uniq.list
  10 col_05_DataSource_uniq.list
  11 col_12_DataValueFootnoteSymbol_uniq.list
  11 col_13_DatavalueFootnote_uniq.list
  12 col_09_DataValueType_uniq.list
  12 col_22_DataValueTypeID_uniq.list
```

Note:

Unix is case-sensitive, so `data` had no matches 


[comment]: # (-----------------------EXERCISE--------------------------------) 



---?image=null.jpg&color=orange
@title[Exercise:  grep -v]
@transition[none]
@snap[north-west]
<h4>Exercise:  grep -v</h4> 
@snapend

```
meta]$ wc -l * | sort -n | grep -v "Data"
   3 col_16_StratificationCategory1_uniq.list
   3 col_23_StratificationCategoryID1_uniq.list
   5 col_02_YearEnd_uniq.list
..
  55 col_19_LocationID_uniq.list
  86 col_21_QuestionID_uniq.list
 373 total

```


[comment]: # (-----------------------EXERCISE--------------------------------) 





---
@title[Filtering output -- grep]
@transition[none]
@snap[north-west]
<h4>Filtering output -- grep</h4> 
@snapend

`grep -v` outputs **unmatched** lines 
`grep -w` matches separate "words" only 

Grep word `-w` uses `space` character to separate words 






---?image=null.jpg&color=orange
@title[Exercise:  grep for words -- -w]
@transition[none]
@snap[north-west]
<h4>Exercise:  grep for words -- -w</h4> 
@snapend

```
meta]$ wc -l * | sort -n | grep -w 10
  10 col_05_DataSource_uniq.list
  10 col_06_Topic_uniq.list
  10 col_17_Stratification1_uniq.list
  10 col_20_TopicID_uniq.list
  10 col_24_StratificationID1_uniq.list
```

- only the lines with `10`s separated by spaces (words) 

[comment]: # (-----------------------EXERCISE--------------------------------) 





---
@title[Patten matching -- Regular Expressions]
@transition[none]
@snap[north-west]
<h4>Patten matching -- Regular Expressions</h4> 
@snapend

Grep accepts _regular expressions_ as patterns to match 

**Regular Expressions** are a way to define character patterns, similar to shell _globbing_

- "ends with `.md`" -- `.md$`
- "starts with `pi`" -- `^pi`


---
@title[Patten matching -- Regular Expressions]
@transition[none]
@snap[north-west]
<h4>Patten matching -- Regular Expressions</h4> 
@snapend

```
meta]$ cd ../..
$ ls | grep '.md$'
PITCHME.md
README.md

$ ls | grep '^pi'
pie_modules/
pie.sh*
pie2.sh*
```

Note:

More on Regular Expressions  
http://tldp.org/LDP/Bash-Beginners-Guide/html/chap_04.html

http://www.regular-expressions.info/posixbrackets.html










+++?image=null.jpg&color=orange
@title[Exercise:  grep from a file]
@transition[none]
@snap[north-west]
<h4>Exercise:  grep from a file</h4> 
@snapend

```
$ wc -l * | sort -n | grep -v 0 > file_lines.txt

$ grep "pie" file_lines.txt 
      16 pie2.sh
      37 pie.sh
```
- no `pie/` or `pie_modules/` directory (`0`s filtered out)
- `grep` accepts _absolute_ & _relative_ paths 

[comment]: # (-----------------------EXERCISE--------------------------------) 








---
@title[File Operations -- creating text files]
@transition[none]
@snap[north-west]
<h4>Creating text files in Bash </h4> 
@snapend


- CLI Redirection 
  - `echo`, redirect specific text 
  - `cat`, redirect (output from) a live stream 
  - `> myfile.txt`, create an empty file (overwrite)
  - `>> myfile.txt`, create an empty file (**no overwrite**) 


+++
@title[File Operations -- creating text files]
@transition[none]
@snap[north-west]
<h4>Creating text files in Bash </h4> 
@snapend
  
- Text editors & commands
  - `nano myfile.txt`, open a new file in nano
  - `vim myfile.txt`, open a new file in vi/vim 
  - `touch myfile.txt`, create an empty file (**no overwrite**)

  
Note:

`:> myfile.txt` for portability & speed 

`:` is POSIX `true`



---?image=null.jpg&color=orange
@title[Exercise:  File creation -- redirection]
@transition[none]
@snap[north-west]
<h4>Exercise:  File creation -- redirection</h4> 
@snapend

```
$ > myemptyfile.txt
$ echo "A short note" > mynote.txt
```

+++?image=null.jpg&color=orange
@title[Exercise:  File creation -- redirection]
@transition[none]
@snap[north-west]
<h4>Exercise:  File creation -- redirection</h4> 
@snapend

```
$ cat > mylongnote.txt 
A long note [ENTER]
This input stream will be redirected into mylongnote.txt [ENTER]
when we terminate the process with CTRL-C [ENTER]
[CTRL-C]
$ ls my*
myemptyfile.txt     mylongnote.txt    mynote.txt 
```

[comment]: # (-----------------------EXERCISE--------------------------------) 









---
@title[Bash's environment  -- menu]
@transition[none]
@snap[north-west]
<h4>Bash's environment  -- menu</h4> 
@snapend

What if we have a recipe somewhere else in the pantry?
- We can modify Bash's PATH note, with our own menu 


---?image=null.jpg&color=orange
@title[Exercise:  update Bash menu]
@transition[none]
@snap[north-west]
<h4>Exercise:  update Bash menu</h4> 
@snapend

```
$ export PATH=$PATH:$HOME/menu
```

Here, we set (and export) the PATH key note to:
- `$PATH` (the previous _contents_ of the PATH key note)
- `:` (the list separator)
- `$HOME/menu` (the shelf with our recipe)



Note:
If you don't have `menu`, make one with `mkdir`:

```
$ cd ~
$ mkdir menu
$ export PATH=$PATH:$HOME/menu
```


[comment]: # (-----------------------EXERCISE--------------------------------) 








---?image=null.jpg&color=green
@title[Shell Process Control]
@transition[none]
@snap[north-west]
<h4>Shell Process Control</h4> 
@snapend

- `CTRL-Z` suspend current process 
- `jobs -l` list active jobs & PIDs 
- `bg` put suspended process in background 
  - `bg %1` put first process in bg
  - `bg %cat` put `cat` process in bg 
- `fg` bring suspended process to foreground 
  - `fg %1` bring first process to fg 
  - `fg %cat` bring `cat` process to fg 
- `kill PID` ask PID process to terminate itself 
  - `kill -9 PID` terminate PID process 


[comment]: # (-----------------------DEFINITIONS------------------------------) 




---?image=null.jpg&color=green
@transition[none]
@snap[north-west]
<h4>Shell Special Parameters</h4> 
@snapend

- `echo $$` PID of current shell 
- `echo $-` options set for current shell (`i` for interactive) 
- `echo $0` shell script name
- `echo $!` PID of last bg process
- `echo $?` last fg exit status 
  - (0 is nice) 
  - (useful for arithmetic & expansion tests) 



+++?image=null.jpg&color=green
@title[Shell Special Parameters]
@transition[none]
@snap[north-west]
<h4>Shell Special Parameters</h4> 
@snapend

- `echo $@` all parameters, individually 
- `echo $*` all parameters, together separated by IFS char 
- `echo $1` first argument from last command 
- `echo $_` last argument, or last command if no arguments
- `echo $#` argument/parameter count from last command

[comment]: # (-----------------------DEFINITIONS------------------------------) 




---?image=null.jpg&color=green
@title[Shell Escape Characters]
@transition[none]
@snap[north-west]
<h4>Shell Escape Characters</h4> 
@snapend

- ` \n ` -- newline 
- ` \t ` -- TAB (horizontal) 
- ` \r ` -- return 
- ` \b ` -- backspace 

- ` \\ ` -- literal backslash character ` \ `
- ` \$ ` -- literal `$` character 


Note:

Escape un-quoted spaces to prevent shell word-splitting:  `filename\ with\ spaces.txt`

More on Escape Characters:
http://tldp.org/LDP/abs/html/escapingsection.html

More on RegEx:
http://tldp.org/LDP/abs/html/x17129.html

[comment]: # (-----------------------DEFINITIONS------------------------------) 








---?image=null.jpg&color=green
@title[Metacharacters & Substitutions]
@transition[none]
@snap[north-west]
<h4>Metacharacters & Substitutions</h4> 
@snapend

- `~` home
- `*` file substitution; zero or more characters
- `?` file substitution; one character
- `[ ]` file substitution; any character between brackets

- `$(cmd)` command substitution with expansion & parentheses 
- `` `cmd` `` command substitution with backticks


+++?image=null.jpg&color=green
@title[Metacharacters & Substitutions]
@transition[none]
@snap[north-west]
<h4>Metacharacters & Substitutions</h4> 
@snapend

- `;`	Command sequence, Sequences of Commands
- `||`	OR conditional execution
- `&&`	AND conditional execution
- `( )`	Group commands, Sequences of Commands
- `&`	Run command in the background, Background Processes
- `#`	Comment


+++?image=null.jpg&color=green
@title[Metacharacters & Substitutions]
@transition[none]
@snap[north-west]
<h4>Metacharacters & Substitutions</h4> 
@snapend

- `$`	Expand the value of a variable
- ` \ `	Prevent or escape interpretation of the next character

- `' '`   Single-quotes, for literal characters & escape expansion ` \ ` (backslash)
- `" "`   Double-quotes, to expand ` \ `, `$`, and `` \` `` (backtick)



Note:

More on metacharacters:
http://faculty.salina.k-state.edu/tim/unix_sg/shell/metachar.html


[comment]: # (-----------------------DEFINITIONS------------------------------) 


