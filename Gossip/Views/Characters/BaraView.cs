using System;
using System.Drawing;
using MonoTouch.CoreGraphics;
using MonoTouch.Foundation;
using MonoTouch.UIKit;

namespace Gossip
{
	[Register("BaraView")]
	public class BaraView : CharacterView 
	{
		public MainViewController mvc { get; set; }

		public BaraView() : base()
		{
			characterId = 0;

			if (UIDevice.CurrentDevice.UserInterfaceIdiom == UIUserInterfaceIdiom.Pad) 
			{
				uiCharacterImages[0] = Resources.baraHateful;
				uiCharacterImages[1] = Resources.baraNasty;
				uiCharacterImages[2] = Resources.baraNotNice;
				uiCharacterImages[3] = Resources.baraUnpleasant;
				uiCharacterImages[4] = Resources.baraSoSo;
				uiCharacterImages[5] = Resources.baraPleasant;
				uiCharacterImages[6] = Resources.baraNice;
				uiCharacterImages[7] = Resources.baraGreat;
				uiCharacterImages[8] = Resources.baraAdorable;
				uiCharacterImages[9] = Resources.baraHello; 
			}
			else
			{
				uiCharacterImages[0] = Resources.baraHateful.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[1] = Resources.baraNasty.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[2] = Resources.baraNotNice.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[3] = Resources.baraUnpleasant.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[4] = Resources.baraSoSo.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[5] = Resources.baraPleasant.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[6] = Resources.baraNice.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[7] = Resources.baraGreat.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[8] = Resources.baraAdorable.Scale(new SizeF(64.0f, 64.0f));
				uiCharacterImages[9] = Resources.baraHello.Scale(new SizeF(64.0f, 64.0f));
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

