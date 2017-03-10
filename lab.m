%K = imread('testbilde1.png','png');

filename = 'gruppe9_kule10_M208_plast_d0895.avi';


Lengde_Topp = 59;
Lengde_Bunn = 2020; %pixel posisjon
Lengde_pixel = Lengde_Bunn - Lengde_Topp; %faktor for lengde i pixel

Skala = 200/Lengde_pixel; %cm

V = VideoReader(filename);

IV1 = read(V,[1,V.NumberOfFrames]);

FPS = V.FrameRate;
%Remove RGB-array
IVbw=squeeze(mean(IV1,3));

%scaling picture
IVbw=IVbw(140:160,75:1784,:);


%masscenter
[m,i]=max(sum(IVbw(:,:,end)<120,1));

plot(sum(IVbw(:,:,end)<120,1))

AA = squeeze(sum(IVbw(:,:,:)<120,1));
imagesc(AA)
[M,I]=max(AA);
t=(1:length(I))/FPS;
z=I*Skala;
plot(t,z,'.'), xlabel('tid, s'), ylabel('høyde, cm')