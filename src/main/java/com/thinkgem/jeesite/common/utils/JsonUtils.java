package com.thinkgem.jeesite.common.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.Map.Entry;

import org.activiti.engine.impl.util.json.JSONObject;

public class JsonUtils
{

	public static String getResult(boolean isSuccess, String msg)
	{
		JSONObject json = new JSONObject();
		json.put("IsSuccess", isSuccess);
		json.put("Message", msg);

		return json.toString();
	}

	public static String getResult(boolean isSuccess, Map<String, String> map)
	{
		JSONObject json = new JSONObject();
		json.put("IsSuccess", isSuccess);
		for (Entry<String, String> entry : map.entrySet())
		{
			json.put(entry.getKey(), entry.getValue());
		}

		return json.toString();
	}

	public static String getResultII(boolean isSuccess, Map<String, Object> map)
	{
		JSONObject json = new JSONObject();
		json.put("IsSuccess", isSuccess);
		for (Entry<String, Object> entry : map.entrySet())
		{
			json.put(entry.getKey(), entry.getValue());
		}

		return json.toString();
	}
	
	public static String getResultIII(boolean isSuccess, Object obj)
	{
		JSONObject json = new JSONObject();
		json.put("IsSuccess", isSuccess);
		json.put("OBJ", getJsonObjectByVO(obj));
		return json.toString();
	}

	/**
	 * 获取属性名(name)，属性值(value)的map组成的JSONObject
	 */
	public static JSONObject getJsonObjectByVO(Object o)
	{
		JSONObject json = new JSONObject();
		Field[] fields = o.getClass().getDeclaredFields();
		for (int i = 0; i < fields.length; i++)
		{
			json.put(fields[i].getName(), getFieldValueByName(fields[i].getName(), o));
		}
		return json;
	}

	/**
	 * 根据属性名获取属性值
	 */
	private static Object getFieldValueByName(String fieldName, Object o)
	{
		try
		{
			String firstLetter = fieldName.substring(0, 1).toUpperCase();
			String getter = "get" + firstLetter + fieldName.substring(1);
			Method method = o.getClass().getMethod(getter, new Class[] {});
			Object value = method.invoke(o, new Object[] {});
			return value;
		} catch (Exception e)
		{
			return null;
		}
	}
}
