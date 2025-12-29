package io.github.wizwix.letsfutsal.dto;

import java.time.LocalTime;
import java.util.Objects;

@SuppressWarnings({"LombokGetterMayBeUsed", "LombokSetterMayBeUsed"})
public class StadiumDTO {
  LocalTime endHour;
  String introduction;
  String location;
  String name;
  String region;
  long stadiumId;
  LocalTime startHour;

  public StadiumDTO() {}

  public StadiumDTO(long stadiumId, String location, String name, String region, LocalTime startHour, LocalTime endHour, String introduction) {
    this.stadiumId = stadiumId;
    this.location = location;
    this.name = name;
    this.region = region;
    this.startHour = startHour;
    this.endHour = endHour;
    this.introduction = introduction;
  }

  public int hashCode() {
    final int PRIME = 59;
    int result = 1;
    final Object $endHour = this.getEndHour();
    result = result * PRIME + ($endHour == null ? 43 : $endHour.hashCode());
    final Object $introduction = this.getIntroduction();
    result = result * PRIME + ($introduction == null ? 43 : $introduction.hashCode());
    final Object $location = this.getLocation();
    result = result * PRIME + ($location == null ? 43 : $location.hashCode());
    final Object $name = this.getName();
    result = result * PRIME + ($name == null ? 43 : $name.hashCode());
    final Object $region = this.getRegion();
    result = result * PRIME + ($region == null ? 43 : $region.hashCode());
    final long $stadiumId = this.getStadiumId();
    result = result * PRIME + Long.hashCode($stadiumId);
    final Object $startHour = this.getStartHour();
    result = result * PRIME + ($startHour == null ? 43 : $startHour.hashCode());
    return result;
  }

  public boolean equals(final Object o) {
    if (o == this) return true;
    if (!(o instanceof StadiumDTO other)) return false;
    if (!other.canEqual(this)) return false;
    final Object this$endHour = this.getEndHour();
    final Object other$endHour = other.getEndHour();
    if (!Objects.equals(this$endHour, other$endHour)) return false;
    final Object this$introduction = this.getIntroduction();
    final Object other$introduction = other.getIntroduction();
    if (!Objects.equals(this$introduction, other$introduction)) return false;
    final Object this$location = this.getLocation();
    final Object other$location = other.getLocation();
    if (!Objects.equals(this$location, other$location)) return false;
    final Object this$name = this.getName();
    final Object other$name = other.getName();
    if (!Objects.equals(this$name, other$name)) return false;
    final Object this$region = this.getRegion();
    final Object other$region = other.getRegion();
    if (!Objects.equals(this$region, other$region)) return false;
    if (this.getStadiumId() != other.getStadiumId()) return false;
    final Object this$startHour = this.getStartHour();
    final Object other$startHour = other.getStartHour();
    return Objects.equals(this$startHour, other$startHour);
  }

  protected boolean canEqual(final Object other) {return other instanceof StadiumDTO;}

  public String toString() {return "StadiumDTO(endHour=" + this.getEndHour() + ", introduction=" + this.getIntroduction() + ", location=" + this.getLocation() + ", name=" + this.getName() + ", region=" + this.getRegion() + ", stadiumId=" + this.getStadiumId() + ", startHour=" + this.getStartHour() + ")";}

  public LocalTime getEndHour() {return this.endHour;}

  public void setEndHour(LocalTime endHour) {this.endHour = endHour;}

  public String getIntroduction() {return this.introduction;}

  public void setIntroduction(String introduction) {this.introduction = introduction;}

  public String getLocation() {return this.location;}

  public void setLocation(String location) {this.location = location;}

  public String getName() {return this.name;}

  public void setName(String name) {this.name = name;}

  public String getRegion() {return this.region;}

  public void setRegion(String region) {this.region = region;}

  public long getStadiumId() {return this.stadiumId;}

  public void setStadiumId(long stadiumId) {this.stadiumId = stadiumId;}

  public LocalTime getStartHour() {return this.startHour;}

  public void setStartHour(LocalTime startHour) {this.startHour = startHour;}
}
