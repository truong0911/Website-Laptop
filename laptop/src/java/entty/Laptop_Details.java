
package entty;


public class Laptop_Details {
    private String manhinh,cpu,ram,ocung,dohoa,trongluong,kichthuoc, id, pid;
    public Laptop_Details() {
    }
    
    public Laptop_Details(String manhinh, String cpu, String ram, String ocung, String dohoa, String trongluong, String kichthuoc) {
        
        this.manhinh = manhinh;
        this.cpu = cpu;
        this.ram = ram;
        this.ocung = ocung;
        this.dohoa = dohoa;
        this.trongluong = trongluong;
        this.kichthuoc = kichthuoc;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }


    public String getManhinh() {
        return manhinh;
    }

    public void setManhinh(String manhinh) {
        this.manhinh = manhinh;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getOcung() {
        return ocung;
    }

    public void setOcung(String ocung) {
        this.ocung = ocung;
    }

    public String getDohoa() {
        return dohoa;
    }

    public void setDohoa(String dohoa) {
        this.dohoa = dohoa;
    }

    public String getTrongluong() {
        return trongluong;
    }

    public void setTrongluong(String trongluong) {
        this.trongluong = trongluong;
    }

    public String getKichthuoc() {
        return kichthuoc;
    }

    public void setKichthuoc(String kichthuoc) {
        this.kichthuoc = kichthuoc;
    }

    @Override
    public String toString() {
        return "Laptop_Details{"+ ", manhinh=" + manhinh + ", cpu=" + cpu + ", ram=" + ram + ", ocung=" + ocung + ", dohoa=" + dohoa + ", trongluong=" + trongluong + ", kichthuoc=" + kichthuoc + '}';
    }


}
