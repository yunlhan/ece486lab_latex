# ECE 486 Control Systems Lab 

## <img src="https://github.com/yunlhan/ece486lab_latex/blob/master/newIcon.png" alt="NEW LATEX ICON" width="135" height="40"/> + <img src="http://cvs.savannah.gnu.org/viewvc/*checkout*/emacs/emacs/etc/images/icons/hicolor/48x48/apps/emacs.png" alt="EMACS ICON" witdh="40" height="40"/>

**_Fall_ _2017_** 

### New Lab Report Template in LaTeX 

> LaTeX template for ECE 486 Lab; this template should be used with "report" section in the lab manual. Please read the documentation for details in the preamble of each `*.tex` file. 

It is recommended to use 

> `TeXLive` on Linux, http://tug.org/texlive

> `MacTex` on Mac OS X, http://tug.org/mactex

> `MikTeX` on Windows, http://miktex.org

For more info about how to use LaTeX (not TeX, TeX is a programming language, however LaTeX is not), see a quick guide from ECE Thesis wiki,

> https://wiki.cites.illinois.edu/wiki/display/ECEThesisReview/LaTeX+Resources

Read the Documentation file ECE LaTeX Guide.pdf down at the bottom of the page. As a starter, you only have to learn briefly how to typeset equations and insert figures. As an experienced user, however, you can grab the template and write your report immediately.

---

### Emacs + LaTeX Portable Set-up (for Windows&reg;) 

Emacs for Windows has evolved with giant leaps over the years. The portable set-up has never been easier!

1. Download `emacs` from [https://ftp.gnu.org/gnu/emacs/windows/](https://ftp.gnu.org/gnu/emacs/windows/). The latest version `emacs-25.2` is what we use in lab.

   (**Note**: You can also download `emacs-deps` for Windows and unpack them over `EMACS_ROOT` directory structure. These dependencies provide extra capabilities to emacs, e.g., `gnutls` for secure connections over the internet. We didn't include them in lab set-up.) 

2. Download `hunspell` from [https://sourceforge.net/projects/ezwinports/files/](https://sourceforge.net/projects/ezwinports/files/). 

3. Download `miktex-portable` from [https://miktex.org/portable](https://miktex.org/portable). 

4. Download `sumatraPDF-portable` from [https://www.sumatrapdfreader.org/download-free-pdf-viewer.html](https://www.sumatrapdfreader.org/download-free-pdf-viewer.html).

5. Unpack them anywhere you have the write privilege (This means you can use this set-up from USB a flash drive!). Keep the folder structure like below

    ``` 
    folder where you unpack everything --+-- emacs25
                                         |
                                         +-- hunspell1323
                                         |
                                         +-- miktex29
                                         |
                                         +-- sumatraPDF312
    ```
  
 6. Copy `_emacs` and `emacs_launch.bat` under `emacs_latex` from this repo  to `EMACS_ROOT`. Detailed documentation is inside `_emacs`.
 
 7. Start emacs with `emacs_launch.bat`. Enjoy!
 
    (**Note**: You can also grab this from `N:\labs\ECE486\ece486_Emacs_LaTeX` on lab computers. It is already set up there.)
