---
title: "The Loadlin+Win95/98/ME mini-HOWTO: Per cominciare:"
source_domain: amasci.com
source_path: ~praxis/Loadlin+Win95-98-ME-Italian-3.html
order: 6027
reachable_from_entry: false
images: 6
internal_links: 3
extracted: 2026-08-07T05:58:51Z
extractor: site_to_paper.py (pandoc)
---

# The Loadlin+Win95/98/ME mini-HOWTO: Per cominciare:

*Source page: `~praxis/Loadlin+Win95-98-ME-Italian-3.html`*

[![Next](next.gif)](Loadlin+Win95-98-ME-Italian-4.html) [![Previous](prev.gif)](Loadlin+Win95-98-ME-Italian-2.html) [![Contents](toc.gif)](Loadlin+Win95-98-ME-Italian.html#toc3)

------------------------------------------------------------------------

## <span id="s3">3. Per cominciare:</span>

## <span id="ss3.1">3.1 Primo:</span>

Modificate o create config.sys nella directory C:\\ di Windows. Il contenuto dovrebbe essere all'incirca il seguente:

> ` `
>
> ------------------------------------------------------------------------
>
>
>     [menu]
>     menuitem=Linux, Mandrake Linux 7.2
>     menuitem=Win98, Windows 98
>     menucolor=15,1
>     menudefault=Win98, 10
>
>     [linux]
>
>     [win98]
>
> ------------------------------------------------------------------------

Se sul vostro sistema esiste gia' un file `config.sys`, inserite il contenuto di quel file sotto la sezione `[win98]`. La sezione `[linux]` deve essere lasciata vuota.

## <span id="ss3.2">3.2 Secondo:</span>

Modificate o create il file `autoexec.bat` nella directory C:\\ di Windows. Il contenuto dovrebbe essere all'incirca il seguente:

> ` `
>
> ------------------------------------------------------------------------
>
>
>     goto %config%
>
>     :linux
>     call c:\linux.bat
>
>     :win98 
>
> ------------------------------------------------------------------------

Come prima, se e' gia' presente un file `autoexec.bat`, inserite il contenuto di quel file sotto la sezione `:win98`.

## <span id="ss3.3">3.3 Terzo:</span>

Create un file dal nome `linux.bat`. Il posto migliore dove salvarlo C:\\ ma potete metterlo in qualsiasi altra cartella purche' facciate riferimento al percorso. Il contenuto dovrebbe essere all'incirca il seguente:

> ` `
>
> ------------------------------------------------------------------------
>
>
>     @echo off
>     c:\loadlin c:\vmlinuz root=/dev/hda5 ro 
>
> ------------------------------------------------------------------------

L'esempio citato assume che `loadlin.exe` e `vmliuz` si trovino entrambi nella directory C:\\ e che linux sia stato installato nella partizione /dev/hda5. La vostra configurazione potrebbe essere diversa.

L'importante assicurarsi che loadlin e il vostro kernel si trovino referenziati correttamente. Tutto qua!

Questo dovrebbe essere sufficiente, ed anche il setup sul mio computer, che effettua il dual boot con Windows98.

------------------------------------------------------------------------

[![Next](next.gif)](Loadlin+Win95-98-ME-Italian-4.html) [![Previous](prev.gif)](Loadlin+Win95-98-ME-Italian-2.html) [![Contents](toc.gif)](Loadlin+Win95-98-ME-Italian.html#toc3)
