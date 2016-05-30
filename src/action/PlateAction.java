package action;

import model.Postplate;
import service.IPostPlateService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PlateAction extends ActionSupport {

	private static final long serialVersionUID = 3334075178958325467L;
	private int plateid;
	private String platetype;
	private String platename;

	public String getPlatename() {
		return platename;
	}

	public void setPlatename(String platename) {
		this.platename = platename;
	}

	public String getPlatetype() {
		return platetype;
	}

	public void setPlatetype(String platetype) {
		this.platetype = platetype;
	}

	public int getPlateid() {
		return plateid;
	}

	public void setPlateid(int plateid) {
		this.plateid = plateid;
	}

	private ActionContext context = ActionContext.getContext();
	/** service **/
	private IPostPlateService postPlateService;

	public void setPostPlateService(IPostPlateService postPlateService) {
		this.postPlateService = postPlateService;
	}

	public String addPlate() throws Exception {
		Postplate plate = new Postplate();
		plate.setPlatename(platetype);
		postPlateService.save(plate);
		return SUCCESS;
	}

	public String modinfo() throws Exception {
		int id = (Integer) context.getSession().get("modifyPlateInfo");
		postPlateService.modifyPlateInfo(id, platename);
		return SUCCESS;
	}

	public String entermodinfo() throws Exception {
		context.getSession().put("modifyPlateInfo", plateid);
		return "entersuccess";
	}

	public String deletePlate() throws Exception {
		postPlateService.delete(plateid);
		return SUCCESS;
	}
}
