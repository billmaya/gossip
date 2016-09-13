using System;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("MortView")]
	public class MortView : CharacterView
	{
		public MainViewController mvc { get; set; }

		public MortView() : base()
		{
			characterId = 4;

			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad) 
			{
				uiCharacterImages[0] = Resources.mortHateful;
				uiCharacterImages[1] = Resources.mortNasty;
				uiCharacterImages[2] = Resources.mortNotNice;
				uiCharacterImages[3] = Resources.mortUnpleasant;
				uiCharacterImages[4] = Resources.mortSoSo;
				uiCharacterImages[5] = Resources.mortPleasant;
				uiCharacterImages[6] = Resources.mortNice;
				uiCharacterImages[7] = Resources.mortGreat;
				uiCharacterImages[8] = Resources.mortAdorable;
				uiCharacterImages[9] = Resources.mortHello; 
			}
			else
			{
				uiCharacterImages[0] = Resources.mortHateful.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[1] = Resources.mortNasty.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[2] = Resources.mortNotNice.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[3] = Resources.mortUnpleasant.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[4] = Resources.mortSoSo.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[5] = Resources.mortPleasant.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[6] = Resources.mortNice.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[7] = Resources.mortGreat.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[8] = Resources.mortAdorable.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[9] = Resources.mortHello.Scale(new CGSize(64.0f, 64.0f));
			}
			
			dimensions = new CGSize(uiCharacterImages[0].Size.Width, uiCharacterImages[0].Size.Height);
			location = new CGPoint(Story.CharacterLocations[characterId, 0], Story.CharacterLocations[characterId, 1]);
			ModifyFrame();
		}

		public override void TouchesEnded (NSSet touches, UIEvent evt)
		{
			base.TouchesEnded (touches, evt);

			if (mvc == null) mvc = ((MainView)this.Superview).mvc;
		}
	}
}

