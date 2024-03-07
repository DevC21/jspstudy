package model;

import common.ActionForward;
import jakarta.servlet.http.HttpServletRequest;

public interface MyInterface{
  public ActionForward getDate(HttpServletRequest request); 
  public ActionForward getTime(HttpServletRequest request); 
  public ActionForward getDateTime(HttpServletRequest request); 
}
