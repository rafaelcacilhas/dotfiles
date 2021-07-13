#  _______         __          __                                         
# |       |.--.--.|  |_.-----.|  |--.----.-----.--.--.--.-----.-----.----.
# |   -  _||  |  ||   _|  -__||  _  |   _|  _  |  |  |  |__ --|  -__|   _|
# |_______||_____||____|_____||_____|__| |_____|________|_____|_____|__|  


import os
import subprocess

#################
# MAIN SETTINGS #
#################

config.load_autoconfig(False)
c.aliases = {'q': 'quit', 'w': 'session-save', 'wq': 'quit --save', 'r': 'restart'}
c.downloads.location.directory = '/home/dilip/Downloads'
c.url.searchengines = {
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        'wk':'https://en.wikipedia.org/wiki/{}', 
        'yt': 'https://www.youtube.com/results?search_query={}',
        'amz':'https://www.amazon.in/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords={}'
}
c.url.default_page = '/home/dilip/.config/qutebrowser/html/startpage.html'
c.url.start_pages = '/home/dilip/.config/qutebrowser/html/startpage.html'
c.content.images = True
c.content.javascript.enabled = True

# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
c.content.cookies.accept = 'all'
c.content.headers.user_agent = 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}'


#################
# OTHER SETINGS #
#################

# --- Completion ---
c.completion.shrink = True

# --- File Select ---
c.fileselect.single_file.command = ["urxvt", "-e", "ranger", "--choosefile={}"]
c.fileselect.multiple_files.command = ["urxvt", "-e", "ranger", "--choosefiles={}"]

# --- Insert Mode ---
c.input.insert_mode.auto_enter = True
c.input.insert_mode.leave_on_load = True

# --- Tabs ---
c.tabs.show = 'multiple'        # Values: always, never, multiple
c.tabs.padding = {"bottom":1, "left":5, "right":5, "top":1}
c.tabs.favicons.show = 'never'    # valuse: always, never

# --- Scrolling ---
c.scrolling.smooth = False

# --- Scrollbar ---
c.completion.scrollbar.width = 12
c.completion.scrollbar.padding = 4

# --- Statusbar ---
c.statusbar.padding = {"bottom":1, "left":1, "right":1, "top":1}

###########################
# UI COLROS CONFIGURATION #
###########################

# ====================== xresources ======================= 
# taken from https://qutebrowser.org/doc/help/configuring.html
def read_xresources(prefix):
    """
    read settings from xresources
    """
    props = {}
    x = subprocess.run(["xrdb", "-query"], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split("\n")
    for line in filter(lambda l: l.startswith(prefix), lines):
        prop, _, value = line.partition(":\t")
        props[prop] = value
    return props

xresources = read_xresources("*")

background = xresources["*.background"]
foreground = xresources["*.foreground"]
error = xresources["*.color1"]
alt_background = "#5F6773"
alt_foreground = "#888888"

# --- Webpages ---
c.colors.webpage.bg = background

if xresources["*.background"] != "#ffffff":
    c.colors.webpage.darkmode.enabled = True

# --- Context menu ---
c.colors.contextmenu.menu.bg = background
c.colors.contextmenu.menu.fg = foreground
c.colors.contextmenu.selected.bg = foreground
c.colors.contextmenu.selected.fg = background

# --- Completions ---
c.colors.completion.fg = alt_foreground  
c.colors.completion.odd.bg = background
c.colors.completion.even.bg = background
c.colors.completion.category.fg = background
c.colors.completion.category.bg = foreground
c.colors.completion.category.border.top = foreground
c.colors.completion.category.border.bottom = background
c.colors.completion.item.selected.fg = foreground
c.colors.completion.item.selected.bg = alt_background
c.colors.completion.item.selected.border.top = alt_background
c.colors.completion.item.selected.border.bottom = alt_background
c.colors.completion.item.selected.match.fg = background
c.colors.completion.match.fg = foreground 
c.colors.completion.scrollbar.fg = alt_background 
c.colors.completion.scrollbar.bg = background 

# --- Downloads ---
c.colors.downloads.bar.bg = alt_background 
c.colors.downloads.error.bg = error

# --- Hints ---
c.colors.hints.bg = background
c.colors.hints.fg = alt_background
c.colors.hints.match.fg = foreground

# --- Messages ---
c.colors.messages.info.bg = alt_background 
c.colors.messages.error.bg = error 

# --- Prompts ---
c.colors.prompts.bg = alt_background
c.colors.prompts.selected.bg = foreground
c.colors.prompts.fg = foreground

# --- Statusbar ---
c.colors.statusbar.normal.bg = background 
c.colors.statusbar.insert.fg = foreground 
c.colors.statusbar.insert.bg = alt_background 
c.colors.statusbar.passthrough.bg = background 
c.colors.statusbar.command.bg = alt_background 
c.colors.statusbar.command.fg = foreground 
c.colors.statusbar.url.warn.fg = 'yellow'

# --- Tabs ---
c.colors.tabs.bar.bg = background 
c.colors.tabs.odd.bg = background 
c.colors.tabs.even.bg = background 
c.colors.tabs.selected.odd.bg = alt_background 
c.colors.tabs.selected.even.bg = alt_background 
c.colors.tabs.pinned.odd.bg = background
c.colors.tabs.pinned.even.bg = background
c.colors.tabs.pinned.selected.odd.bg = alt_background
c.colors.tabs.pinned.selected.even.bg = alt_background


################
# FONT SETTING #
################

c.fonts.default_family = '11px "SauceCodePro Nerd Font"'
c.fonts.default_size = '11px'
c.fonts.contextmenu = '11px "SauceCodePro Nerd Font"'
c.fonts.completion.entry = '11px "SauceCodePro Nerd Font"'    # Font used in the completion widget.
c.fonts.debug_console = '11px "SauceCodePro Nerd Font"'       # Font used for the debugging console.
c.fonts.prompts = 'default_size SauceCodePro Nerd Font'       # Font used for prompts.
c.fonts.statusbar = '11px "SauceCodePro Nerd Font"'           # Font used in the statusbar.


################################
# KEY BINDINGS FOR NORMAL MODE #
################################

config.bind('gh', 'home')
config.bind('ch', 'history-clear')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('D', 'tab-only')
config.bind('ww', 'open -w')

config.bind(';i', 'set downloads.location.directory ~/Pictures ;; hint links download')
config.bind(';I', 'set downloads.location.directory ~/Pictures ;; hint images download')
config.bind(';D', 'set downloads.location.directory ~/Documents ;; hint links download')
config.bind(';d', 'set downloads.location.directory ~/Downloads ;; hint links download')
config.bind(';v', 'set downloads.location.directory ~/Videos ;; hint links download')

config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show multiple never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show multiple never')
config.bind('td', 'devtools')
