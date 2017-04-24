## Etabler nedsivningsanlæg

Dette modul indeholder oopsætningen, der skal bruges i forbindelse med Etablering af nedsivningsanlæg

#### VEJLEDNING

Installer modulet (tilpas sti efter behov):
```xml
<module name="formular-etabler_nedsivningsanlaeg" dir="custom/formular-config/etabler_nedsivningsanlaeg" permissionlevel="public"/>
```

Includér konfiguration i den eksisterende formular konfiguration med:
```xml
<include src="[module:formular-etabler_nedsivningsanlaeg.dir]/config/formular-config.xml" nodes="/config/*" mustexist="false"/>
```

Se formularen med:
```text
http://HOST/spatialmap?page=formular-skin&formular=etabler_nedsivningsanlaeg
```

#### Bemærk
Dette modul benytter funktionalitet fra SBSYS og mailservice fra Septima




