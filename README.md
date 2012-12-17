VR-JOULUKALENTERI
=================

Raportoi VR:n tähänastiset [joulukalenterin][vrjoulu] tarjoukset.

Asennus
-------

Vaatii [TickTickin][ticktick]. Asenna TickTick PATHiin, suosittelemme standardia `~/scripts` hakemistoa.

Laita vr-joulu croniin niin ajetaan aamuysiltä. Postia tulee perästä jos oot konffannut cronin siten. Muuten menee logeihin.

```shell
$ crontab -e
# m h  dom mon dow   command
  0 9  *   *   *     ~/scripts/vr-joulu/vr-joulu.sh
```

[vrjoulu]:http://netapps.fi/joulukalenteri/
[ticktick]:http://github.com/kristopolous/TickTick
