## Ansøgning om tilladelse til etablering af jordvarmeanlæg

Dette modul indeholder oopsætningen, der skal bruges i forbindelse med Ansøgning om tilladelse til etablering af jordvarmeanlæg

#### VEJLEDNING

Installer modulet (tilpas sti efter behov):
```xml
<module name="formular-jordvarmeanlaeg" dir="custom/formular-config/jordvarmeanlaeg" permissionlevel="public"/>
```

Includér konfiguration i den eksisterende formular konfiguration med:
```xml
<include src="[module:formular-jordvarmeanlaeg.dir]/config/formular-config.xml" nodes="/config/*" mustexist="false"/>
```

Se formularen med:
```text
http://HOST/spatialmap?page=formular-skin&formular=jordvarmeanlaeg
```

#### Bemærk
Dette modul benytter funktionalitet fra SBSYS




