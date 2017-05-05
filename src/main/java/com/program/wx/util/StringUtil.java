package com.program.wx.util;

public class StringUtil {

	public static boolean isEmpty(Object object) {
		if (object != null) {
			if (object instanceof String) {
				if (!object.equals(""))
					return false;
				return true;
			}
			return false;
		}
		return true;
	}
}
