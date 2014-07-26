using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

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
				uiCharacterImages[0] = Resources.ellaHateful.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[1] = Resources.ellaNasty.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[2] = Resources.ellaNotNice.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[3] = Resources.ellaUnpleasant.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[4] = Resources.ellaSoSo.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[5] = Resources.ellaPleasant.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[6] = Resources.ellaNice.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[7] = Resources.ellaGreat.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[8] = Resources.ellaAdorable.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[9] = Resources.ellaHello.Scale(new SizeF(64.0f, 64.0f));
			} 
			
			dimensions = new SizeF(uiCharacterImages[0].Size.Width, uiCharacterImages[0].Size.Height);
			location = new PointF(Story.CharacterLocations[characterId, 0], Story.CharacterLocations[characterId, 1]);
			ModifyFrame();
		}

		public override void TouchesEnded (NSSet touches, UIEvent evt)
		{
			base.TouchesEnded (touches, evt);

			if (mvc == null) mvc = ((MainView)this.Superview).mvc;
		}
	}
}

