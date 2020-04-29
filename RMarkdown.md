# R Markdown Basics

## YAML Metadata

The R Markdown template begins with a block of YAML [^Yet Another Markup Language] metadata.  This metadata is used by tools such as Pandoc and knitr when generating reports.  While these tools support multiple metadata options, for now we will use the following metadata items. 

```yaml
---
title: "ASSIGNMENT 4"
author: "Firstname Lastname"
date: '2010-02-14'
output:
  html_document: default
bibliography: bibliography.bib
---
```

The bibliography metadata points to the file `bibliography.bib` which contains a BibTeX formatted bibliography.  You create BibTeX formatted bibliographies using a standard text editor or generate them using tools like [Zotero](https://www.zotero.org/).  

## Markdown Basics

There are multiple Markdown variations.  R Markdown uses [Pandoc's Markdown](https://pandoc.org/MANUAL.html#pandocs-markdown) which is useful for authoring technical documentation.    Other variations include [Bookdown](https://bookdown.org/), [GitHub Flavored Markdown](https://github.github.com/gfm/), and [CommonMark](https://spec.commonmark.org/0.29/).

The following is a quick summary of basic Markdown. 

### Headers

```
# H1
## H2
### H3
#### H4
##### H5
###### H6
```

### Formatting

```
Use *astericks* or _underscores_ for italics.

Use double **astericks** or double __underscores__ for bold.  

Strikethrough text with two ~~tidles~~

Subscripts are writting by surrounding the subscripted text by tidles. H~2~O is a liquid. 

Superscripts are written by surrounding the superscripted text by  2^10^ is 1024.

Use three or more `-` characters at the beginning of a line followed by a newline to create a horizontal rule
```

### Lists

This is a bullet list.  You can use `*`, `+`, or `-` to begin each item. 

```
* One
* Two 
* Three
```

This is an ordered list.

```
1. One
2. Two
3. Three
```

### Images

```
![Caption](./images/image.png)
```

### Block Quotes

```
> This is block quoted text
```

### LaTeX Equations

Examples of an inline LaTeX equations. 

```
$P(A \mid B)$
$\frac{a}{b}$
$\sum_{x = a}^{b} f(x)$
```

### Footnotes

```
^[This is a footnote in R Markdown]
```

### Links

```
This is creates a link to [Google](https://www.google.com/)
```

### Bibliography Citations

BibTeX formatted bibliography contains this entry. 

```
@book{lander2014r,
  title={R for Everyone: Advanced Analytics and Graphics},
  author={Lander, J.P.},
  isbn={9780321888037},
  lccn={2013027407},
  series={Addison-Wesley data and analytics series},
  url={https://books.google.com/books?id=3eBVAgAAQBAJ},
  year={2014},
  publisher={Addison-Wesley}
}
```

You can reference it in your report using the following code. 

```
Discovering Statistics Using R [@lander2014r]
```

Add a section called `# References` to the end of your report and it will automatically generate citations. 
