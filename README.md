# pure

[![Slack Room](https://fisherman-wharf.herokuapp.com/badge.svg)](https://fisherman-wharf.herokuapp.com)

Yet another port of the [ZSH pure prompt](https://github.com/sindresorhus/pure) to the [fish shell](https://github.com/fish-shell/fish-shell) 🐟.

Why create another `pure`? The other fish themes either didn't have the async git functionality or they were too buggy or low performance to use day-to-day. This theme does have working async git fetching and dirty state checking so your shell wont get slowed down when working on larger git repos. Where possible I've attempted to get the possible performance since this is something I use constantly every day.

As it is now, it's not intended to be customizable, basically all values are hard-coded to sensible defaults.

Based on [vkovtash/pure](https://github.com/vkovtash/pure) with some ideas from [rafaelrinaldi/pure](https://github.com/rafaelrinaldi/pure) but with a lot of changes.

<!-- ![pure](https://cloud.githubusercontent.com/assets/8317250/13661599/777665a2-e6d7-11e5-9078-eae115fa140a.png) -->

## Install

With [fisherman](https://github.com/fisherman/fisherman):

```fish
fisher MaxMilton/pure
```

## Licence

`pure` is an MIT licensed open source project. See [LICENCE](https://github.com/MaxMilton/pure/blob/master/LICENCE).

-----

© 2018 [Max Milton](https://maxmilton.com)
