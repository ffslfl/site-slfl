# site-slfl
Site Dateien für Freifunk Kreis Schleswig-Flensburg

## Babel Firmware bauen: (Stand: 15.12.2017 16:13Uhr)

1. Clone diese gluon Repo: ``git clone https://github.com/freifunk-ffm/gluon.git``
2. Wechsel auf die branch "n_babel-work" ``git checkout n_babel-work``
3. Clone diese Site in den ordner site ``git clone https://github.com/ffslfl/site-slfl.git site``
4. Wechsel die branch der site auf "babel-test" ``cd site && git checkout babel-test``
5. führe den normalen build aus im gluon Ordner (eventuell nun noch ``cd ..`` ausführen)

## Changelog

### 2017.1.1-0.4.1
- Fastd funktioniert wieder
- Software in lua umgesetzt
- Tunneldigger aktualisiert
- Alfred packet entfernt, da wir respondd nutzen
- USB Support hinzugefügt
- Teilkompatiblität von fastd und tunneldigger mit offiziellen gluon paketen hergestellt
- Verbindungszeit der Router minimiert
- Dropdown um zwischen fastd, tunneldigger oder kein mesh-vpn zu wählen
- Interface der tunnel von l2tp0 auf mesh-vpn gewechselt (REBOOT required!)
