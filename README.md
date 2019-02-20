# ping-cursor.vim

*Shedding light on your cursor location when you have lost it in the muck*

![Screenshot of the Action](/images/vim-ping-cursor_screenshot.png?raw=true)

## What it provides?

This plugin provides a user-command called `PingCursor` which illuminates the
current location of the cursor temporarily so that you can easily find it.
Please see the *Mappings* section for details on how best to utilize the
`PingCursor` command.

## Installation

The following is the recommended approach using the vim8's built in package
management. If you aren't using vim8 then upgrade to get the latest goodness.

    cd ~/.vim/
    git submodule add https://github.com/uptech/vim-ping-cursor.git pack/bundle/start/vim-ping-cursor
    git add .
    git commit -m "Added vim-ping-cursor plugin to my setup."

If you are using another method, you are on your own.

## Mappings

The recommended mapping for this plugin is to simply map a key combo to run the
`PingCursor` command for you. This can easily be done by adding the following
to your `~/.vimrc`.

    nnoremap <leader>p :PingCursor<cr>

In the above example I map my normal mode `<leader>p` key combo to execute the
`PingCursor` command, in turn highlighting the current location of my cursor
momentarily.

You can of course map this command anyway you like, or even choose not to map
it and just execute the command as follows when you need it.

    :PingCursor<cr>

## Configuration

The duration of the cursor flash can be customized in your `~/.vimrc`:

    " This is the default
    let g:ping_cursor_flash_milliseconds = 250

## Why I Built This

### Initial Impetus

Let me start out by explaining a scenario that happens to me at work on a
relatively regular basis. I often find myself working deep in the thicket of
code, when all of the sudden I am distracted by another co-worker asking a
question or simply making some noise. I found not being able to find my cursor
quickly frustrating.

### First Attempt

So, I thought to myself, I wonder if [Vim](http://www.vim.org/) has cursor row
highlighting or possibly even cursor column highlighting. Sure enough
[Vim](http://www.vim.org/) has both and enabling them was as simple as setting
the following in my `.vimrc`.

    set cursorline
    set cursorcolumn

### The Problem

It turns out, the `cursorcolumn` option when enabled causes the full screen to
redraw. You might be thinking to yourself, that should not be a problem, I
have a very fast machine and it is just some text. I am sorry to inform you
that you are wrong.  It turns out that redrawing the full screen is quite
costly in [Vim](http://www.vim.org/). More importently redrawing the full
screen interacts with lots of other features like *cursor movement*, *Ctrl-p
based completion*, and many others. This means that if you have cursor
highlighting on and use any of those features your [Vim](http://www.vim.org/)
performance will tank during those operations.

### The Solution

The following are a number of threads, blogs, etc. where I found people
discussing this issue and trying to come up with work arounds for this issue.

* [http://vim.1045645.n5.nabble.com/Vim-7-slows-down-when-highlighting-cursor-line-td1148280.html](http://vim.1045645.n5.nabble.com/Vim-7-slows-down-when-highlighting-cursor-line-td1148280.html)
* [https://gist.github.com/pera/2624765](https://gist.github.com/pera/2624765)
* [http://briancarper.net/blog/590/cursorcolumn--cursorline-slowdown](http://briancarper.net/blog/590/cursorcolumn--cursorline-slowdown)

After testing out a number of these work arounds I finally ended up deciding
to use the cursor pinging solution described in [Brian Caprer's blog
post](http://briancarper.net/blog/590/cursorcolumn--cursorline-slowdown) and
create a [Vim](http://www.vim.org/) plugin so other people could easily obtain
this work around.

## Credits

Most of the credit here should go to Brian Carper because he provided a very
valuable [blog
post](http://briancarper.net/blog/590/cursorcolumn--cursorline-slowdown) that
I used as the basis for this vim plugin.

Credit must also go out to all the others out there that struggled with this
issue as I did and dug in to [Vim](http://www.vim.org/) enough to understand
what was actually happening.

## License

Copyright (c) Andrew De Ponte. Distributed under the same terms as Vim itself.
See `:help license`.
