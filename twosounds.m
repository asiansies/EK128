%This script will play two sounds back to back.

load gong
gongsoung = y;
load chirp
chirpsound = y;
twosound = [gongsound,twosound];
sound(twosound, Fs)