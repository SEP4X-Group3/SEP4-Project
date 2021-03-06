package dk.via.sep4.LoraWanConnection;

/**
 * @author $(Alina Chelmus)
 * @author Timothy Engkar
 */
public class SendDownLink {
  private String cmd;
  private String EUI;
  private int port;
  private boolean confirmed;
  private String data;

  public SendDownLink(String cmd, String EUI, int port, boolean confirmed, String data) {
    this.cmd = cmd;
    this.EUI = EUI;
    this.port = port;
    this.confirmed = confirmed;
    this.data = data;
  }

  public String getData() {
    return data;
  }

  public void setData(String data) {
    this.data = data;
  }

  public String getCmd() {
    return cmd;
  }

  public void setCmd(String cmd) {
    this.cmd = cmd;
  }

  public String getEUI() {
    return EUI;
  }

  public void setEUI(String EUI) {
    this.EUI = EUI;
  }

  public int getPort() {
    return port;
  }

  public void setPort(int port) {
    this.port = port;
  }

  public boolean isConfirmed() {
    return confirmed;
  }

  public void setConfirmed(boolean confirmed) {
    this.confirmed = confirmed;
  }
}
