import UIKit
import Foundation
import PlaygroundSupport

// UIImage *theImage = [UIImage imageNamed:@"someImageName.png"];
// UIImageView *imgView = [[UIImageView alloc] initWithImage:theImage];

// self.imageView = imgView; // assuming you have a property called imageView

// [imgView release];

// [self.view addSubview:self.imageView]; //in your view controller
// once you've done this, you can use:

// [self.imageView setHidden:YES];



// img.isHidden = false


// le+


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

let customFont = UIFont(name: "Bauhaus LT Demi Normal", size: UIFont.labelFontSize)

//let cfURL = Bundle.main.url(forResource: "Bauhaus LT Demi", withExtension: "ttf") as! CFURL
//
//CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)

let logo = UIImage(named: "logo.png")
let mainImgH = UIImage(named: "aokiH.jpg")
let mainImgS = UIImage(named: "aoki.jpg")

let navBarBGImage = UIImage(named: "body_bg_small.png")
let navbarTitleLbl : UILabel
navbarTitleLbl = UILabel()

let lblContents = [
    "Procedimentos de contenção especial:",
    "SCP-009 deve ser mantido em um quarto especialmente construído para imitar o de uma casa normal. Além da mobilia comum de um quarto, deve contar com um computador equipado com peças de última geração, sem admissão de falhas técnicas, como falta de energia ou componentes defeituosos. Manutenções devem ser realizadas mensalmente para a garantia do status do procedimento de contenção. O cômodo deve contar também com um pufe grande que deve ser mantido aproximadamente 65% cheio.",
    "É essencial que ao lado da cama haja um espelho no qual conste espaço para no mínimo duas tomadas e duas saídas USB no mínimo 3.1 e idealmente 3.2.",
    "Em caso de sinais de aflição ou simplesmente tédio iniciar umatransmissão da série de tv 'Bob Esponja Calça Quadrada', que parece ter efeitos tranquilizantes no SCP-Aoki.",
    "Descrição: ",
    "SCP-Aoki é um jovem de ██ anos chamado Rodrigo Ryo Aoki que foi encontrado no campo 746-47-498, localizado em ███ ████████ ███████████, na cidade de Osasco, onde viveu sua vida inteira até o momento de atrair a atenção da SCP Foundation, possui uma personalidade tranquila e e amigável, frequentemente demonstrando ser prestativo.",
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
        font = customFont
        adjustsFontForContentSizeCategory = true
        text = "Placeholder"
        textColor = txtBodyColor
        numberOfLines = 0
        lineBreakMode = NSLineBreakMode.byWordWrapping
        textAlignment = .justified
    }
}

class HomepageViewController : UIViewController {
    
    var arrayLabels = [ContentLabel]()
    var decryptCount : Int = 0, timerLimit : Int = 0, i : Int = 0, j : Int = 0
    var button : CustomBtn!
    let contentView = UIView()
    let imgView = UIImageView(image: mainImgH, highlightedImage: mainImgS)
    
//    let margins = view.layoutMarginsGuide
    
    func getLblAnchors(lbl0: ContentLabel, lbl: ContentLabel, lblHeight: CGFloat, view: UIView) {
        NSLayoutConstraint.activate([
            lbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 360),
            lbl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            lbl.heightAnchor.constraint(equalToConstant: lblHeight)
        ])
    }
    
        @objc func decryptText(sender: UIButton) {
            i = 0
            imgView.isHighlighted = true
            sender.isHidden = true
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                
                self.decryptCount += 1
                if self.timerLimit < (self.arrayLabels.count - 1) {
                    if self.decryptCount != 0 {
                        NSLayoutConstraint.activate([
                            self.arrayLabels[self.decryptCount].topAnchor.constraint(equalTo: self.arrayLabels[self.decryptCount - 1].topAnchor, constant: CGFloat(self.decryptCount)),
                        ])
                    }
//                    self.i += 1
                    if self.decryptCount >= self.arrayLabels.count - 1 {
                        timer.invalidate()
                    }
                }
            }
            i = 0
            return
        }
    
    override func loadView() {
        var charCount, lineCount : Int
        var lblHeight : CGFloat
        
        contentView.frame.size.height = 5000
//        contentView.frame.size.width = 360
        
        navbarTitleLbl.text = "SCP-Aoki"
        navbarTitleLbl.textColor = .white
        
        let homepageScrollView = UIScrollView()
        
        self.navigationItem.titleView = navbarTitleLbl
        
        homepageScrollView.contentSize = contentView.frame.size
        homepageScrollView.addSubview(contentView)
        homepageScrollView.flashScrollIndicators()
        homepageScrollView.backgroundColor = .white
        
        contentView.backgroundColor = txtBodyBGColor
        
        contentView.addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        button = CustomBtn()
        
        button.setTitle("Verificar Credencial", for: .normal)
        
        homepageScrollView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(decryptText), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            //imgView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0),
            imgView.widthAnchor.constraint(equalToConstant: CGFloat(imgWidth)),
            imgView.heightAnchor.constraint(equalToConstant: CGFloat(((imgWidth * 16) / 9))),
//            imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat((windowWidth - imgWidth) / 2)),
//            imgView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            //imgView.bottomAnchor.constraint(equalTo: imgView.topAnchor, constant: CGFloat(((imgWidth * 16) / 9))),
            
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 200),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
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
                    arrayLabels[i].topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 20),
                    arrayLabels[i].leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                    //                    arrayLabels[i].centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                    //                    arrayLabels[i].trailingAnchor.constraint(equalTo: arrayLabels[i].leadingAnchor, constant: 290),
                    arrayLabels[i].heightAnchor.constraint(equalToConstant: lblHeight)
                ])
            }
            else {
                getLblAnchors(lbl0: arrayLabels[i-1], lbl: arrayLabels[i], lblHeight: lblHeight, view: contentView)
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


