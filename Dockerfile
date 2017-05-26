# Core Image
FROM microsoft/windowsservercore AS core

ENV RUBY_MAJOR 2.2
ENV RUBY_VERSION 2.2.4
ENV DEVKIT_VERSION 4.7.2
ENV DEVKIT_BUILD 20130224-1432

RUN mkdir C:\\tmp

ADD https://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-${RUBY_VERSION}-x64.exe C:\\tmp
RUN C:\\tmp\\rubyinstaller-%RUBY_VERSION%-x64.exe /silent /dir="C:\Ruby22_x64" /tasks="assocfiles,modpath"

ADD https://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-64-${DEVKIT_VERSION}-${DEVKIT_BUILD}-sfx.exe C:\\tmp
RUN C:\\tmp\\DevKit-mingw64-64-%DEVKIT_VERSION%-%DEVKIT_BUILD%-sfx.exe -o"C:\DevKit" -y

RUN rmdir /S /Q c:\\tmp

WORKDIR C:\\DevKit

RUN setx PATH %PATH%;C:\DevKit\bin;C:\Ruby22_x64\bin -m
RUN echo - C:\\Ruby22_x64 > config.yml
RUN ruby dk.rb install

CMD ["irb"]
