using System;
using CoreGraphics;
using CoreGraphics;
using Foundation;
using UIKit;

namespace Gossip
{
	[Register("EllaView")]
	public class EllaView : CharacterView
	{
		public MainViewController mvc { get; set; }

		public EllaView() : base()
		{
			characterId = 3; 

			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad) 
			{
				uiCharacterImages[0] = Resources.ellaHateful;
				uiCharacterImages[1] = Resources.ellaNasty;
				uiCharacterImages[2] = Resources.ellaNotNice;
				uiCharacterImages[3] = Resources.ellaUnpleasant;
				uiCharacterImages[4] = Resources.ellaSoSo;
				uiCharacterImages[5] = Resources.ellaPleasant;
				uiCharacterImages[6] = Resources.ellaNice;
				uiCharacterImages[7] = Resources.ellaGreat;
				uiCharacterImages[8] = Resources.ellaAdorable;
				uiCharacterImages[9] = Resources.ellaHello; 
			}
			else
			{
				uiCharacterImages[0] = Resources.ellaHateful.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[1] = Resources.ellaNasty.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[2] = Resources.ellaNotNice.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[3] = Resources.ellaUnpleasant.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[4] = Resources.ellaSoSo.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[5] = Resources.ellaPleasant.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[6] = Resources.ellaNice.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[7] = Resources.ellaGreat.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[8] = Resources.ellaAdorable.Scale(new CGSize(64.0f, 64.0f));
				uiCharacterImages[9] = Resources.ellaHello.Scale(new CGSize(64.0f, 64.0f));
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

