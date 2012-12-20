VR-JOULUKALENTERI
=================

Raportoi VR:n [joulukalenterin][vrjoulu] tähänastiset tarjoukset.

Asennus
-------

Vaatii [TickTickin][ticktick]. Asenna `ticktick.sh` PATHiin tai samaan hakemistoon kuin `vr-joulu.sh`. Suosittelemme standardia `~/scripts` hakemistoa.

Laita vr-joulu croniin niin ajetaan aamuysiltä. Postia tulee perästä jos oot konffannut cronin siten. Muuten menee logeihin.

```shell
$ crontab -e
# m h  dom mon dow   command
  0 9  *   *   *     ~/scripts/vr-joulu/vr-joulu.sh
```

[vrjoulu]:http://netapps.fi/joulukalenteri/
[ticktick]:http://github.com/kristopolous/TickTick
