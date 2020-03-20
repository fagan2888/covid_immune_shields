clf
% automatically create postscript whenever
% figure is drawn
tmpfilename = 'figsir_finalsize';
tmpfilebwname = sprintf('%s_noname_bw',tmpfilename);
tmpfilenoname = sprintf('%s_noname',tmpfilename);

tmpprintname = fixunderbar(tmpfilename);
% for use with xfig and pstex
tmpxfigfilename = sprintf('x%s',tmpfilename);

tmppos= [0.2 0.2 0.7 0.7];
tmpa1 = axes('position',tmppos);

set(gcf,'DefaultLineMarkerSize',10);
% set(gcf,'DefaultLineMarkerEdgeColor','k');
% set(gcf,'DefaultLineMarkerFaceColor','w');
set(gcf,'DefaultAxesLineWidth',2);

set(gcf,'PaperPositionMode','auto');

% main data goes here
%clear finalsize
%clear pars
pars.beta=2;
pars.gamma=1;
pars.alpha_range = [0:0.2:20];
pars.R0=pars.beta/pars.gamma;
y0 = [0.999 0.001 0];

%for i=1:length(pars.alpha_range),
%  pars.alpha=pars.alpha_range(i);
%  opts=odeset('RelTol',1e-8,'MaxStep',0.01);
%  [t,y]=ode45(@sir_shield,[0 100],y0,opts,pars);
%  stats.finalsize(i)=y(end,3);
%  stats.Sfinal(i)=y(end,1);
%end
tmph=plot(pars.alpha_range,stats.Sfinal,'k--');
set(tmph,'linewidth',3,'color',[0.5 0.5 0.5]);
hold on
tmph=plot(pars.alpha_range,stats.finalsize,'k-');
set(tmph,'linewidth',3,'color','k');
tmph=plot(pars.alpha_range,ones(size(pars.alpha_range))*1/pars.R0,'k:');
set(tmph,'linewidth',3,'color','k');
tmpt=text(6,1.1/pars.R0,'Herd immunity threshold, ${\cal{R}}_0^{-1}$');
set(tmpt,'interpreter','latex','fontsize',16);


% loglog(,, '');
%
%
% Some helpful plot commands
% tmph=plot(x,y,'ko');
% set(tmph,'markersize',10,'markerfacecolor,'k');
% tmph=plot(x,y,'k-');
% set(tmph,'linewidth',2);

set(gca,'fontsize',20);

% for use with layered plots
% set(gca,'box','off')

% adjust limits
% tmpv = axis;
% axis([]);
ylim([0 1]);
% xlim([]);

% change axis line width (default is 0.5)
% set(tmpa1,'linewidth',2)

% fix up tickmarks
% set(gca,'xtick',[1 100 10^4])
% set(gca,'ytick',[1 100 10^4])

% creation of postscript for papers
% psprint(tmpxfigfilename);

% the following will usually not be printed 
% in good copy for papers
% (except for legend without labels)

% legend
% tmplh = legend('stuff',...);
tmplh = legend('Uninfected, $S_{\infty}$', 'Epidemic size, $R_{\infty}$');
set(tmplh,'interpreter','latex','fontsize',16,'location','northwest');
% remove box
% set(tmplh,'visible','off')
legend('boxoff');

xlabel('Shield strength, $\alpha$','fontsize',20,'verticalalignment','top','interpreter','latex');
ylabel('Population fraction','fontsize',20,'verticalalignment','bottom','interpreter','latex');
% title('','fontsize',24)
% 'horizontalalignment','left');

% for writing over the top
% coordinates are normalized again to (0,1.0)
tmpa2 = axes('Position', tmppos);
set(tmpa2,'visible','off');
% first two points are normalized x, y positions
% text(,,'','Fontsize',14);

% automatic creation of postscript
% without name/date
psprintc(tmpfilenoname);
psprint(tmpfilebwname);

tmpt = pwd;
tmpnamememo = sprintf('[source=%s/%s.ps]',tmpt,tmpprintname);
text(1.05,.05,tmpnamememo,'Fontsize',6,'rotation',90);
datenamer(1.1,.05,90);
% datename(.5,.05);
% datename2(.5,.05); % 2 rows

% automatic creation of postscript
psprintc(tmpfilename);

% set following on if zooming of 
% plots is required
% may need to get legend up as well
%axes(tmpa1)
%axes(tmplh)
clear tmp*
