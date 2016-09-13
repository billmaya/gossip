using System;
using CoreGraphics;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("MaxView")]
	public class MaxView : CharacterView
	{
		public MainViewController mvc { get; set; }

		public MaxView () : base()
		{
			characterId = 2; 

			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad) 
			{
				uiCharacterImages[0] = Resources.maxHateful;
				uiCharacterImages[1] = Resources.maxNasty;
				uiCharacterImages[2] = Resources.maxNotNice;
				uiCharacterImages[3] = Resources.maxUnpleasant;
				uiCharacterImages[4] = Resources.maxSoSo;
				uiCharacterImages[5] = Resources.maxPleasant;
				uiCharacterImages[6] = Resources.maxNice;
				uiCharacterImages[7] = Resources.maxGreat;
				uiCharacterImages[8] = Resources.maxAdorable;
				uiCharacterImages[9] = Resources.maxHello; 
			}
			else
			{
				uiCharacterImages[0] = Resources.maxHateful.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[1] = Resources.maxNasty.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[2] = Resources.maxNotNice.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[3] = Resources.maxUnpleasant.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[4] = Resources.maxSoSo.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[5] = Resources.maxPleasant.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[6] = Resources.maxNice.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[7] = Resources.maxGreat.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[8] = Resources.maxAdorable.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[9] = Resources.maxHello.Scale(new CGSize(64.0f, 64.0f));
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

