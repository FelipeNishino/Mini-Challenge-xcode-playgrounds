import UIKit
import Foundation
import PlaygroundSupport

// 9 : 16

let txtLinkColor : UIColor = .init(red: 0.6, green: 0, blue: 0.03, alpha: 1.0)
let txtLinkBGColor : UIColor = .init(red: 0.8, green: 0.28, blue: 0.34, alpha: 1.0)
let btnBorderColor : UIColor = .init(red: 0.38, green: 0, blue: 0.02, alpha: 1.0)
let txtLinkColorVisited : UIColor = .init(red: 0.35, green: 0, blue: 0.03, alpha: 1.0)
let txtBodyColor : UIColor = .init(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
let txtTitleColor : UIColor = .init(red: 0.3, green: 0, blue: 0.035, alpha: 1.0)
let txtBodyBGColor : UIColor = .init(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)

let windowWidth = 375
let windowHeight = 812

let imgWidth = 300

let btnWidth = 200

let logo = UIImage(named: "logo.png")
let mainImgH = UIImage(named: "aokiH.jpg")
let mainImgS = UIImage(named: "aoki.jpg")

let navBarBGImage = UIImage(named: "body_bg_small.png")
let navbarTitleLbl : UILabel
navbarTitleLbl = UILabel()

let lblContents = [
    "Procedimentos de contenção especial: SCP-009 deve ser mantido em um quarto especialmente construído para imitar o de uma casa normal. Além da mobilia comum de um quarto, deve contar com um computador equipado com peças de última geração, sem admissão de falhas técnicas, como falta de energia ou componentes defeituosos. Manutenções devem ser realizadas mensalmente para a garantia do status do procedimento de contenção. O cômodo deve contar também com um pufe grande que deve ser mantido aproximadamente 65% cheio.",
    "É essencial que ao lado da cama haja um espelho no qual conste espaço para no mínimo duas tomadas e duas saídas USB no mínimo 3.1 e idealmente 3.2.",
    "Em caso de sinais de aflição ou simplesmente tédio iniciar umatransmissão da série de tv 'Bob Esponja Calça Quadrada', que parece ter efeitos tranquilizantes no SCP-Aoki.",
    "Descrição: SCP-Aoki é um jovem de ██ anos chamado Rodrigo Ryo Aoki que foi encontrado no campo 746-47-498, localizado em ███ ████████ ███████████, na cidade de Osasco, onde viveu sua vida inteira até o momento de atrair a atenção da SCP Foundation, possui uma personalidade tranquila e e amigável, frequentemente demonstrando ser prestativo.",
    "Durante sua vivência em liberdade estudou no Ensino Fundamental I na escola [DATA EXPUNGED], e posteriormente estudou o Ensino Fundamental II e Médio na escola [DATA EXPUNGED].",
    "Apresenta interesses comuns e inofensivos entre jovens em sua faixa etária, com um gosto especial para jogar videogames, ouvir música e assistir filmes.",
    "Em relação à sua escolha de vestes, opta normalmente por roupas mais confortáveis, não necessáriamente considerando o apelo visual em si, a não ser em situações de interações sociais.",
    "O elemento SCP-Aoki pôde ser observado frequentemente com os seus fones de ouvido intra-auriculares brancos, suportando o conhecimento da fundação sobre seus passa tempos.",
    "Pouco antes da admissão do sujeito na fundação este ingressou no curso de jogos digitais no Centro Universitário Senac.",
    "Aparentemente, SCP-Aoki também demonstra uma certa reserva em relação ao materialismo, guardando em seu quarto apenas itens de valor sentimental.",
    "███████: Bom, você sempre quis cursar jogos digitais?",
    "Aoki: Na verdade não, desde pequeno tive interesse em programação e gosto de jogar video-games, eu nem sabia da existência de um curso de graduação em jogos digitais.",
    "█: E por que estudar programação em jogos digitais então e não BCC/TADS/etc...?",
    "A: Eu sentia que o curso focado somente nisso poderia vir a se tornar massante, então a graduação de jogos digitais foi uma boa solução, integrando um hobby com uma vocação profissional.",
    "█: Certo, de acordo então com os resultados de recentes observações você será transferido para um novo projeto, muito obrigado pela cooperação.",
    "Nota especial sobre a situação do SCP-Aoki: Devido aos altos índices de capacidade e potencial observados em um período de ███ dias, a partir de ██/██/████ SCP-Aoki deve ser retirado de seu estado de contenção e será inserido no programa Apple Developer Academy, visando prover uma elevação do sujeito nas diversas habilidades que tal projeto incentiva e treina."
]

//40 caracteres por linha

class CustomBtn : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawCustomBtn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        drawCustomBtn()
    }
    
    func drawCustomBtn() {
        backgroundColor = txtLinkColor
        showsTouchWhenHighlighted = true
        setTitle("Botão", for: .normal)
        setTitleColor(.white, for: .normal)
        
        layer.cornerRadius = 9.0
        layer.borderColor = btnBorderColor.cgColor
        layer.borderWidth = 1.5
    }
}

class ContentLabel : UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.lblStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        lblStyle()
    }
    
    func lblStyle() {
        adjustsFontForContentSizeCategory = true
        text = "Placeholder"
        textColor = txtBodyColor
        numberOfLines = 0
        lineBreakMode = NSLineBreakMode.byWordWrapping
        textAlignment = .justified
        backgroundColor = .init(red: 0.5, green: 0, blue: 0, alpha: 0.2)
    }
}

class HomepageViewController : UIViewController {
    
    var arrayLabels = [ContentLabel]()
    var decryptCount : Int = 0, timerLimit : Int = 0, i : Int = 0, j : Int = 0
    var button : CustomBtn!
    var imgBtn = UIButton()
    let contentView = UIView()
    
    func getLblAnchors(lbl0: ContentLabel, lbl: ContentLabel, lblHeight: CGFloat) {
        NSLayoutConstraint.activate([
            lbl.topAnchor.constraint(equalTo: arrayLabels[0].topAnchor, constant: 0),
//            .bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: 300),
            lbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            lbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 360),
//            lbl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            lbl.heightAnchor.constraint(equalToConstant: lblHeight),
        ])
    }
    
    
        @objc func decryptText(sender: UIButton) {
            imgBtn.isHighlighted = true
            sender.isHidden = true
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                self.decryptCount += 1
                
                NSLayoutConstraint.activate([
                    self.arrayLabels[self.decryptCount].topAnchor.constraint(equalTo: self.arrayLabels[self.decryptCount - 1].bottomAnchor, constant: 20)
                ])

                if self.decryptCount >= self.arrayLabels.count - 1 {
                    timer.invalidate()
                }
            }

            return
        }


    
    override func loadView() {
        var charCount, lineCount : Int
        var lblHeight : CGFloat
        
        contentView.frame.size.height = 3000
        
        navbarTitleLbl.text = "SCP-Aoki"
        navbarTitleLbl.textColor = .white
        
        let homepageScrollView = UIScrollView()
        
        self.navigationItem.titleView = navbarTitleLbl
        
        homepageScrollView.contentSize = contentView.frame.size
        homepageScrollView.addSubview(contentView)
        homepageScrollView.flashScrollIndicators()
        homepageScrollView.backgroundColor = .white
        
        homepageScrollView.backgroundColor = txtBodyBGColor
        
        button = CustomBtn()
        
        imgBtn.setImage(mainImgH, for: .normal)
        imgBtn.setImage(mainImgS, for: .highlighted)
        
        button.setTitle("Verificar Credencial", for: .normal)
        
        homepageScrollView.addSubview(button)
        contentView.addSubview(imgBtn)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        imgBtn.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(decryptText), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            imgBtn.widthAnchor.constraint(equalToConstant: CGFloat(imgWidth)),
            imgBtn.heightAnchor.constraint(equalToConstant: CGFloat(((imgWidth * 16) / 9))),
            imgBtn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imgBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat(((windowWidth - imgWidth) / 2))),
            
            button.topAnchor.constraint(equalTo: imgBtn.bottomAnchor, constant: 20),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat((windowWidth - btnWidth) / 2))
        ])
        
        for i in 0...(lblContents.count - 1) {
            
            arrayLabels.append(ContentLabel())
            
            arrayLabels[i].text = lblContents[i]
            
            charCount = lblContents[i].count
            lineCount = ((charCount / 40) + 3) * Int(arrayLabels[i].font.lineHeight)
            lblHeight = CGFloat(lineCount)
            
            contentView.addSubview(arrayLabels[i])
    
            if i == 0 {
                NSLayoutConstraint.activate([
                    arrayLabels[i].topAnchor.constraint(equalTo: button.bottomAnchor, constant: 50),
                    arrayLabels[i].bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: 300),
                    arrayLabels[i].leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                    arrayLabels[i].trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 360),
                    arrayLabels[i].heightAnchor.constraint(equalToConstant: lblHeight)
                ])
            }
            else {
                getLblAnchors(lbl0: arrayLabels[i-1], lbl: arrayLabels[i], lblHeight: lblHeight)
                
                
//                NSLayoutConstraint.activate([
//                    arrayLabels[i].topAnchor.constraint(equalTo: arrayLabels[i - 1].bottomAnchor, constant: 50),
//                    arrayLabels[i].bottomAnchor.constraint(equalTo: arrayLabels[i].topAnchor, constant: 300),
//                    arrayLabels[i].leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//                    arrayLabels[i].trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 360),
//                    arrayLabels[i].heightAnchor.constraint(equalToConstant: lblHeight)
//                ])
            }
            
            arrayLabels[i].translatesAutoresizingMaskIntoConstraints = false
        }
        self.view = homepageScrollView
    }
}


let rootViewController = HomepageViewController()
let navigationController = UINavigationController(rootViewController: rootViewController)
navigationController.navigationBar.setBackgroundImage(navBarBGImage, for: .top, barMetrics: .default)
navigationController.navigationItem.titleView = navbarTitleLbl

navigationController.preferredContentSize = CGSize(width: windowWidth, height: windowHeight)
PlaygroundPage.current.liveView = navigationController;

/*
 Cores:
 fonte titulo #901
 link #b01
 link visitado #824
 texto body #333
 */


