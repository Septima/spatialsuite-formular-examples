## Anmeldelse udbringning af spildevandsslam

Dette modul indeholder oopsætningen, der skal bruges i forbindelse med Anmeldelse udbringning af spildevandsslam

#### VEJLEDNING

Installer modulet (tilpas sti efter behov):
```xml
<module name="formular-slam" dir="custom/formular-config/slam" permissionlevel="public"/>
```

Includér konfiguration i den eksisterende formular konfiguration med:
```xml
<include src="[module:formular-slam.dir]/config/formular-config.xml" nodes="/config/*" mustexist="false"/>
```

Se formularen med:
```text
http://HOST/spatialmap?page=formular-skin&formular=slam
```

#### Bemærk
Dette modul benytter funktionalitet fra SBSYS og mailservice fra Septima




