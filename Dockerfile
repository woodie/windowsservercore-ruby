FROM microsoft/windowsservercore

RUN mkdir C:\\tmp
RUN mkdir C:\\DevKit

WORKDIR C:\\DevKit

ADD https://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.2.4-x64.exe C:\\tmp
RUN C:\\tmp\\rubyinstaller-2.2.4-x64.exe /silent /dir="C:\Ruby224-x64" /tasks="assocfiles,modpath"

ADD https://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe C:\\tmp
RUN C:\\tmp\\DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe -o"C:\DevKit" -y

RUN rmdir /S /Q c:\\tmp

RUN echo - C:/Ruby224-x64 > config.yml
RUN ruby dk.rb install

CMD ["ruby","-v"]
