 const {
    aceVimMap,
    mapkey,
    imap,
    imapkey,
    getClickableElements,
    vmapkey,
    map,
    unmap,
    unmapAllExcept,
    vunmap,
    cmap,
    addSearchAlias,
    removeSearchAlias,
    tabOpenLink,
    readText,
    Clipboard,
    Front,
    Hints,
    Visual,
    RUNTIME
} = api;

Hints.style('border: solid 2px #373B41; color:#52C196; background: initial; background-color: #1D1F21;');
Hints.style("border: solid 2px #373B41 !important; padding: 1px !important; color: #C5C8C6 !important; background: #1D1F21 !important;", "text");
Visual.style('marks', 'background-color: #52C19699;');
Visual.style('cursor', 'background-color: #81A2BE;');

settings.theme = `
:root {
  --fg: #C5C8C6;
  --bg: #282A2E;
  --bg-dark: #1D1F21;
  --border: #373b41;
  --main-fg: #81A2BE;
  --accent-fg: #52C196;
  --info-fg: #AC7BBA;
  --select: #585858;
}
.sk_theme {
background: var(--bg);
color: var(--fg);
  background-color: var(--bg);
  border-color: var(--border);
  font-family: var(--font);
  font-size: var(--font-size);
  font-weight: var(--font-weight);
}
input {
  font-family: var(--font);
  font-weight: var(--font-weight);
}
.sk_theme tbody {
  color: var(--fg);
}
.sk_theme input {
  color: var(--fg);
}
#sk_hints .begin {
  color: var(--accent-fg) !important;
}
#sk_tabs .sk_tab {
  background: var(--bg-dark);
  border: 1px solid var(--border);
}
#sk_tabs .sk_tab_title {
  color: var(--fg);
}
#sk_tabs .sk_tab_url {
  color: var(--main-fg);
}
#sk_tabs .sk_tab_hint {
  background: var(--bg);
  border: 1px solid var(--border);
  color: var(--accent-fg);
}
.sk_theme #sk_frame {
  background: var(--bg);
  opacity: 0.2;
  color: var(--accent-fg);
}
.sk_theme .title {
  color: var(--accent-fg);
}
.sk_theme .url {
  color: var(--main-fg);
}
.sk_theme .annotation {
  color: var(--accent-fg);
}
.sk_theme .omnibar_highlight {
  color: var(--accent-fg);
}
.sk_theme .omnibar_timestamp {
  color: var(--info-fg);
}
.sk_theme .omnibar_visitcount {
  color: var(--accent-fg);
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
  background: var(--bg-dark);
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
  background: var(--border);
}
.sk_theme #sk_omnibarSearchArea {
  border-top-color: var(--border);
  border-bottom-color: var(--border);
}
.sk_theme #sk_omnibarSearchArea input,
.sk_theme #sk_omnibarSearchArea span {
  font-size: var(--font-size);
}
.sk_theme .separator {
  color: var(--accent-fg);
}
#sk_banner {
  font-family: var(--font);
  font-size: var(--font-size);
  font-weight: var(--font-weight);
  background: var(--bg);
  border-color: var(--border);
  color: var(--fg);
  opacity: 0.9;
}
#sk_keystroke {
  background-color: var(--bg);
}
.sk_theme kbd .candidates {
  color: var(--info-fg);
}
.sk_theme span.annotation {
  color: var(--accent-fg);
}
/* ---------- Search ---------- */
#sk_status,
#sk_find {
  font-size: var(--font-size);
  border-color: var(--border);
}
.sk_theme kbd {
  background: var(--bg-dark);
  border-color: var(--border);
  box-shadow: none;
  color: var(--fg);
}
.sk_theme .feature_name span {
  color: var(--main-fg);
}
/* ---------- ACE Editor ---------- */
#sk_editor {
  background: var(--bg-dark) !important;
  height: 50% !important;
  /* Remove this to restore the default editor size */
}
.ace_dialog-bottom {
  border-top: 1px solid var(--bg) !important;
}
.ace-chrome .ace_print-margin,
.ace_gutter,
.ace_gutter-cell,
.ace_dialog {
  background: var(--bg) !important;
}
.ace-chrome {
  color: var(--fg) !important;
}
.ace_gutter,
.ace_dialog {
  color: var(--fg) !important;
}
.ace_cursor {
  color: var(--fg) !important;
}
.normal-mode .ace_cursor {
  background-color: var(--fg) !important;
  border: var(--fg) !important;
  opacity: 0.7 !important;
}
.ace_marker-layer .ace_selection {
  background: var(--select) !important;
}
.ace_editor,
.ace_dialog span,
.ace_dialog input {
  font-family: var(--font);
  font-size: var(--font-size);
  font-weight: var(--font-weight);
}`;

mapkey('p', "Open the clipboard's URL in the current tab", function() {
    Clipboard.read(function(response) {
        window.location.href = response.data;
    });
});

settings.hintAlign = 'left';
settings.modeAfterYank = 'Normal';





addSearchAlias('au', 'aur', 'https://aur.archlinux.org/packages/?O=0&SeB=nd&K=', 's');
addSearchAlias('aw', 'arch wiki', 'https://wiki.archlinux.org/index.php?title=Special:Search&search=', 's');
addSearchAlias('d', 'duckduckgo', 'https://duckduckgo.com/?q=', 's');
addSearchAlias('gh', 'github', 'https://github.com/search?utf8=✓&q=', 's');
addSearchAlias('r', 'reddit', 'https://old.reddit.com/r/', 's');
addSearchAlias('st', 'steam', 'https://store.steampowered.com/search/?term=', 's');
addSearchAlias('w', 'wikipedia', 'https://en.wikipedia.org/wiki/Special:Search/', 's');
addSearchAlias('ofi', 'offi', 'https://docs.google.com/spreadsheets/d/1kc12nuki6PYQCYrp-iorL9NHzp0n_QgDR4ZOb6csrNY/edit#gid=0', 'o');
addSearchAlias('ya', 'yandex', 'https://yandex.ru/search/?text=', 's');
addSearchAlias('spr', 'speedrun', 'https://www.speedrun.com/', 's');
addSearchAlias('ru', 'rutracker', 'https://rutracker.org/forum/tracker.php?nm=', 's');
addSearchAlias('gist', 'gist', 'https://gist.github.com/search?q=', 's');
addSearchAlias('g', 'google', 'https://google.com/search?hl=en&q=', 's');
addSearchAlias('s', 'stackoverflow', 'http://stackoverflow.com/search?q=', 's');
addSearchAlias('tt', 'dict', 'https://thefreedictionary.com/', 's');
addSearchAlias('gm', 'googlemaps', 'https://www.google.com/maps/search/', 's');
addSearchAlias('ps', 'prysh', 'https://pry.sh/', 's');
addSearchAlias('gm', 'googlemaps', 'https://www.google.com/maps/search/', 's');
addSearchAlias('t', 'thesaurus', 'https://www.thesaurus.com/browse/', 's');
addSearchAlias('bi', 'bing', 'https://www.bing.com/search?q=', 's');
addSearchAlias('u', 'searchcode', 'https://searchcode.com/?q=', 's');
addSearchAlias('sga', 'google-after', 'https://google.com/search?hl=en&q=after:2022 ', 's');
addSearchAlias('i', 'iaskai', 'https://iask.ai/?mode=question&options[detail_level]=detailed&q=', 's');
addSearchAlias('gt', 'translate', 'http://translate.google.com/#auto|auto|', 's');
addSearchAlias('sr', 'searx', 'https://searx.be/search?q=', 's');
addSearchAlias('st', 'startpage', 'https://www.startpage.com?q=', 's');
addSearchAlias('p', 'phind', 'https://www.phind.com/search?q=', 's');
addSearchAlias('mj', 'mojeek', 'https://www.mojeek.com/search?q=', 's');
addSearchAlias('br', 'brave', 'https://search.brave.com/search?q=', 's');
addSearchAlias('qw', 'qwant', 'https://www.qwant.com/?q=', 's');
addSearchAlias('pre', 'presearch', 'https://presearch.com/search?q=', 's');
addSearchAlias('yt', 'youtube', 'https://www.youtube.com/results?search_query=', 's');
addSearchAlias('tw', 'twitch', 'https://www.twitch.tv/search?term=', 's');

settings.defaultSearchEngine = 'st';

unmap('u');
mapkey('u', '#3Restore closed tab', function() {
    RUNTIME("openLast");
});


map(']', ']]');
map('[', '[[');
// Move Tab Left/Right
map('>', '>>');
map('<', '<<');
 
mapkey('on', '#3Open newtab', function() {
        tabOpenLink("https://www.google.com/");
});

mapkey('<Ctrl-;>', '#4Go back in history', ()=> history.go(-1), {repeatIgnore: true})
mapkey('<Ctrl-\'>', '#4Go forward in history', ()=> history.go(1), {repeatIgnore: true})

const orgStyle = (link, title) => `[[${link}][${title}]]`;
mapkey('co', "Copy as Org", ()=> Clipboard.write(orgStyle(location.href, document.title)))

// zh and zl scroll left and right
map('zh', 'h');
map('zl', 'l');

// h and l switch to the tab to the left or right
map('h', 'E');
map('l', 'R');


map('zb', 'b');
mapkey("b", "#1Open a link in non-active new tab or click", () => {
  Hints.create("", Hints.dispatchMouseClick, { tabbed: true, active: false });
});
map('zf', 'f');

map('J', 'oh');

map('a', 'ab');
unmap('ab');
unmap('aa');


