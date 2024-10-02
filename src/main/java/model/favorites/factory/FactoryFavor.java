package model.favorites.factory;

import model.Icommand;
import model.dashboard.command.FreeCreateCmd;
import model.dashboard.command.FreeCreateWriteCmd;
import model.dashboard.command.FreeDeleteCmd;
import model.dashboard.command.FreeListCmd;
import model.dashboard.command.FreeReadCmd;
import model.dashboard.command.FreeUpdateCmd;
import model.dashboard.command.FreeUpdatedCmd;
import model.dashboard.command.ProjCreateCmd;
import model.dashboard.command.ProjCreateWriteCmd;
import model.dashboard.command.ProjDeleteCmd;
import model.dashboard.command.ProjListCmd;
import model.favorites.command.FavoritesCreateCmd;
import model.favorites.command.FavoritesDeleteCmd;
import model.favorites.command.FavoritesPostListCmd;
import model.favorites.command.FavoritesProjListCmd;

public class FactoryFavor {
	private FactoryFavor() {}
	private static FactoryFavor factFavor = new FactoryFavor();
	public static FactoryFavor newInstance() {
		return factFavor;
	}

	public Icommand createInstance(String fn) {
		if (fn.equals("FAVOR_CREATE")) {
			return new FavoritesCreateCmd();
		} else if (fn.equals("FAVOR_DEL")) {
			return new FavoritesDeleteCmd();
		} else if (fn.equals("FAVOR_POSTLIST")) {
			return new FavoritesPostListCmd();
		} else if (fn.equals("FAVOR_PROJLIST")) {
			return new FavoritesProjListCmd();
		}

		return null;
	}
}
