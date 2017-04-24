## Færdigmelding af nedsivningsanlæg

Dette modul indeholder oopsætningen, der skal bruges i forbindelse med Færdigmelding af nedsivningsanlæg

#### VEJLEDNING

Installer modulet (tilpas sti efter behov):
```xml
<module name="formular-faerdigmelding_nedsivningsanlaeg" dir="custom/formular-config/faerdigmelding_nedsivningsanlaeg" permissionlevel="public"/>
```

Includér konfiguration i den eksisterende formular konfiguration med:
```xml
<include src="[module:formular-faerdigmelding_nedsivningsanlaeg.dir]/config/formular-config.xml" nodes="/config/*" mustexist="false"/>
```

Se formularen med:
```text
http://HOST/spatialmap?page=formular-skin&formular=faerdigmelding_nedsivningsanlaeg
```

#### Bemærk
Dette modul benytter funktionalitet fra SBSYS og mailservice fra Septima




