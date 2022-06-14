## Getting the data

To get this list, I manually looked through many pages of BTTV emotes, collecting the data from the network panel and adding it to a JSON file, e.g. `pepe-all.json`.

I collected from the following pages (example queries are the XHR requests the page makes to its own API):

- Top Emotes (example query: `https://api.betterttv.net/3/emotes/shared/top?offset=0&limit=50`). I manually scanned these.
- Search for pepe (example query: `https://api.betterttv.net/3/emotes/shared/search?query=pepe&offset=0&limit=50`)
- Search for peepo (example query: `https://api.betterttv.net/3/emotes/shared/search?query=peepo&offset=0&limit=50`)

These are enumerable but I acquired the data by navigating the site as a user normally would.

I ran the following script (which has a dependency on [jq](https://stedolan.github.io/jq/)) to copy to my clipboard:

    cat pepe-all.json | jq 'unique' | pbcopy

I pasted the contents of my clipboard into `pepe.json`.

If I'm missing any, feel free to submit a PR.