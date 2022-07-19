//
//  NewsfeedController.swift
//  gb_vk_client
//
//  Created by 5vi5t on 14.07.2022.
//

import UIKit

class NewsfeedController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var news = [Newsfeed]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: "HeaderNewsfeedCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierHeaderNewsfeedCell)
    tableView.register(UINib(nibName: "TextNewsfeedCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierTextNewsfeedCell)
    tableView.register(UINib(nibName: "FooterNewsfeedCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierFooterNewsfeedCell)
    tableView.register (PhotoNewsfeedCell.self, forCellReuseIdentifier: reuseIdentifierPhotoNewsfeedCell)
    mockNews()
  }
  
  func mockNews() {
    let news1 = Newsfeed(image: "https://sun9-west.userapi.com/sun9-7/s/v1/if1/o8C0ciKzzFSE9zTYAyvplSXi2eYZhIogPCOXyeeBoRVRvUuFQGiMrsPSZtUptAOpI9tDRyCa.jpg?size=1280x777&quality=96&type=album", name: "➟ Bike", date: "давным-давно", text: "Andorra XC World Cup 2022\nТройка лучших среди женщин — Алессандра Келлер, Энн Терпстра и Ребекка МакКоннел.\nМатиас Флакигер, Алан Хазерли и Влад Даскалу заняли первые 3 места в сегодняшнем XCC среди мужчин.",
                         photos: nil,
//                          ["https://sun9-east.userapi.com/sun9-57/s/v1/ig2/-YBXwF1cbheCLGj3Awe5detP-yejjVx48IdVmhRiQZzT8qwfATv4SGacAcMow1EmfMD0F0HaryS04hysAMni8lip.jpg?size=1280x854&quality=95&type=album", "https://sun9-north.userapi.com/sun9-77/s/v1/ig2/Tl4PI_VumvpnMDGrOnJ7oyKPr6NFjwkRVDuTSqn9_PJIIdbWWukz4eIK-4g1OIguYPcpFx0bedZ_AcAUtDdFEW9L.jpg?size=1280x854&quality=95&type=album", "https://sun9-north.userapi.com/sun9-82/s/v1/ig2/1ftOQUJN20oNQksox_HLll_FNZNN3_g697e2nauOwJ9UxJ2lBIsoiwu7yxJFw5Ggq6g2qwk1hPVM8WiHyj6gCyfJ.jpg?size=1280x854&quality=95&type=album", "https://sun9-west.userapi.com/sun9-39/s/v1/ig2/2sghQDbYWq-62MgPCaly6FEtwwl13nhJJaVi3oQtmxir8dlWJwRj5VLMvlwpStOKc7Na4O1wz4Y4lN_FBIdHgp7L.jpg?size=1280x854&quality=95&type=album", "https://sun9-west.userapi.com/sun9-40/s/v1/ig2/NmyzLP6mNLWZY_Xb5-kRhD1E5Rt4joffECWyI_nOBE8mrrFD3syPAzrA-3ph5apWJPgR3VHg2uHMcOwrR3qN9vAF.jpg?size=1280x854&quality=95&type=album"],
                         likes: 12, comments: 0, reposts: 1, views: 2000)
    let news2 = Newsfeed(image: "https://sun9-west.userapi.com/sun9-7/s/v1/if1/o8C0ciKzzFSE9zTYAyvplSXi2eYZhIogPCOXyeeBoRVRvUuFQGiMrsPSZtUptAOpI9tDRyCa.jpg?size=1280x777&quality=96&type=album", name: "➟ Bike", date: "давным-давно", text: "Andorra XC World Cup 2022\nТройка лучших среди женщин — Алессандра Келлер, Энн Терпстра и Ребекка МакКоннел.\nМатиас Флакигер, Алан Хазерли и Влад Даскалу заняли первые 3 места в сегодняшнем XCC среди мужчин.",
                         photos: nil,
//                          ["https://sun9-east.userapi.com/sun9-57/s/v1/ig2/-YBXwF1cbheCLGj3Awe5detP-yejjVx48IdVmhRiQZzT8qwfATv4SGacAcMow1EmfMD0F0HaryS04hysAMni8lip.jpg?size=1280x854&quality=95&type=album", "https://sun9-north.userapi.com/sun9-77/s/v1/ig2/Tl4PI_VumvpnMDGrOnJ7oyKPr6NFjwkRVDuTSqn9_PJIIdbWWukz4eIK-4g1OIguYPcpFx0bedZ_AcAUtDdFEW9L.jpg?size=1280x854&quality=95&type=album", "https://sun9-north.userapi.com/sun9-82/s/v1/ig2/1ftOQUJN20oNQksox_HLll_FNZNN3_g697e2nauOwJ9UxJ2lBIsoiwu7yxJFw5Ggq6g2qwk1hPVM8WiHyj6gCyfJ.jpg?size=1280x854&quality=95&type=album", "https://sun9-west.userapi.com/sun9-39/s/v1/ig2/2sghQDbYWq-62MgPCaly6FEtwwl13nhJJaVi3oQtmxir8dlWJwRj5VLMvlwpStOKc7Na4O1wz4Y4lN_FBIdHgp7L.jpg?size=1280x854&quality=95&type=album", "https://sun9-west.userapi.com/sun9-40/s/v1/ig2/NmyzLP6mNLWZY_Xb5-kRhD1E5Rt4joffECWyI_nOBE8mrrFD3syPAzrA-3ph5apWJPgR3VHg2uHMcOwrR3qN9vAF.jpg?size=1280x854&quality=95&type=album"],
                         likes: 12, comments: 0, reposts: 2, views: 2000)
    let news3 = Newsfeed(image: "https://sun9-west.userapi.com/sun9-7/s/v1/if1/o8C0ciKzzFSE9zTYAyvplSXi2eYZhIogPCOXyeeBoRVRvUuFQGiMrsPSZtUptAOpI9tDRyCa.jpg?size=1280x777&quality=96&type=album", name: "➟ Bike", date: "давным-давно", text: "Andorra XC World Cup 2022\nТройка лучших среди женщин — Алессандра Келлер, Энн Терпстра и Ребекка МакКоннел.\nМатиас Флакигер, Алан Хазерли и Влад Даскалу заняли первые 3 места в сегодняшнем XCC среди мужчин.",
                         photos: nil,
//                          ["https://sun9-east.userapi.com/sun9-57/s/v1/ig2/-YBXwF1cbheCLGj3Awe5detP-yejjVx48IdVmhRiQZzT8qwfATv4SGacAcMow1EmfMD0F0HaryS04hysAMni8lip.jpg?size=1280x854&quality=95&type=album", "https://sun9-north.userapi.com/sun9-77/s/v1/ig2/Tl4PI_VumvpnMDGrOnJ7oyKPr6NFjwkRVDuTSqn9_PJIIdbWWukz4eIK-4g1OIguYPcpFx0bedZ_AcAUtDdFEW9L.jpg?size=1280x854&quality=95&type=album", "https://sun9-north.userapi.com/sun9-82/s/v1/ig2/1ftOQUJN20oNQksox_HLll_FNZNN3_g697e2nauOwJ9UxJ2lBIsoiwu7yxJFw5Ggq6g2qwk1hPVM8WiHyj6gCyfJ.jpg?size=1280x854&quality=95&type=album", "https://sun9-west.userapi.com/sun9-39/s/v1/ig2/2sghQDbYWq-62MgPCaly6FEtwwl13nhJJaVi3oQtmxir8dlWJwRj5VLMvlwpStOKc7Na4O1wz4Y4lN_FBIdHgp7L.jpg?size=1280x854&quality=95&type=album", "https://sun9-west.userapi.com/sun9-40/s/v1/ig2/NmyzLP6mNLWZY_Xb5-kRhD1E5Rt4joffECWyI_nOBE8mrrFD3syPAzrA-3ph5apWJPgR3VHg2uHMcOwrR3qN9vAF.jpg?size=1280x854&quality=95&type=album"],
                         likes: 12, comments: 0, reposts: 3, views: 2000)
    let news4 = Newsfeed(image: "https://sun9-west.userapi.com/sun9-7/s/v1/if1/o8C0ciKzzFSE9zTYAyvplSXi2eYZhIogPCOXyeeBoRVRvUuFQGiMrsPSZtUptAOpI9tDRyCa.jpg?size=1280x777&quality=96&type=album", name: "➟ Bike", date: "давным-давно", text: "Andorra XC World Cup 2022\nТройка лучших среди женщин — Алессандра Келлер, Энн Терпстра и Ребекка МакКоннел.\nМатиас Флакигер, Алан Хазерли и Влад Даскалу заняли первые 3 места в сегодняшнем XCC среди мужчин.",
                         photos: nil,
//                          ["https://sun9-east.userapi.com/sun9-57/s/v1/ig2/-YBXwF1cbheCLGj3Awe5detP-yejjVx48IdVmhRiQZzT8qwfATv4SGacAcMow1EmfMD0F0HaryS04hysAMni8lip.jpg?size=1280x854&quality=95&type=album", "https://sun9-north.userapi.com/sun9-77/s/v1/ig2/Tl4PI_VumvpnMDGrOnJ7oyKPr6NFjwkRVDuTSqn9_PJIIdbWWukz4eIK-4g1OIguYPcpFx0bedZ_AcAUtDdFEW9L.jpg?size=1280x854&quality=95&type=album", "https://sun9-north.userapi.com/sun9-82/s/v1/ig2/1ftOQUJN20oNQksox_HLll_FNZNN3_g697e2nauOwJ9UxJ2lBIsoiwu7yxJFw5Ggq6g2qwk1hPVM8WiHyj6gCyfJ.jpg?size=1280x854&quality=95&type=album", "https://sun9-west.userapi.com/sun9-39/s/v1/ig2/2sghQDbYWq-62MgPCaly6FEtwwl13nhJJaVi3oQtmxir8dlWJwRj5VLMvlwpStOKc7Na4O1wz4Y4lN_FBIdHgp7L.jpg?size=1280x854&quality=95&type=album", "https://sun9-west.userapi.com/sun9-40/s/v1/ig2/NmyzLP6mNLWZY_Xb5-kRhD1E5Rt4joffECWyI_nOBE8mrrFD3syPAzrA-3ph5apWJPgR3VHg2uHMcOwrR3qN9vAF.jpg?size=1280x854&quality=95&type=album"],
                         likes: 12, comments: 0, reposts: 4, views: 2000)
    let news5 = Newsfeed(image: "https://sun9-west.userapi.com/sun9-7/s/v1/if1/o8C0ciKzzFSE9zTYAyvplSXi2eYZhIogPCOXyeeBoRVRvUuFQGiMrsPSZtUptAOpI9tDRyCa.jpg?size=1280x777&quality=96&type=album", name: "➟ Bike", date: "давным-давно", text: "Andorra XC World Cup 2022\nТройка лучших среди женщин — Алессандра Келлер, Энн Терпстра и Ребекка МакКоннел.\nМатиас Флакигер, Алан Хазерли и Влад Даскалу заняли первые 3 места в сегодняшнем XCC среди мужчин.",
                         photos: nil,
//                          ["https://sun9-east.userapi.com/sun9-57/s/v1/ig2/-YBXwF1cbheCLGj3Awe5detP-yejjVx48IdVmhRiQZzT8qwfATv4SGacAcMow1EmfMD0F0HaryS04hysAMni8lip.jpg?size=1280x854&quality=95&type=album", "https://sun9-north.userapi.com/sun9-77/s/v1/ig2/Tl4PI_VumvpnMDGrOnJ7oyKPr6NFjwkRVDuTSqn9_PJIIdbWWukz4eIK-4g1OIguYPcpFx0bedZ_AcAUtDdFEW9L.jpg?size=1280x854&quality=95&type=album", "https://sun9-north.userapi.com/sun9-82/s/v1/ig2/1ftOQUJN20oNQksox_HLll_FNZNN3_g697e2nauOwJ9UxJ2lBIsoiwu7yxJFw5Ggq6g2qwk1hPVM8WiHyj6gCyfJ.jpg?size=1280x854&quality=95&type=album", "https://sun9-west.userapi.com/sun9-39/s/v1/ig2/2sghQDbYWq-62MgPCaly6FEtwwl13nhJJaVi3oQtmxir8dlWJwRj5VLMvlwpStOKc7Na4O1wz4Y4lN_FBIdHgp7L.jpg?size=1280x854&quality=95&type=album", "https://sun9-west.userapi.com/sun9-40/s/v1/ig2/NmyzLP6mNLWZY_Xb5-kRhD1E5Rt4joffECWyI_nOBE8mrrFD3syPAzrA-3ph5apWJPgR3VHg2uHMcOwrR3qN9vAF.jpg?size=1280x854&quality=95&type=album"],
                         likes: 12, comments: 0, reposts: 5, views: 2000)
    
    news.append(contentsOf: [news1, news2, news3, news4, news5])
  }
}
