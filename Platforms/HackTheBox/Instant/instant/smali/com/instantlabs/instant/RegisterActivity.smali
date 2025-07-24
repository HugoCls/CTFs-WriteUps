.class public Lcom/instantlabs/instant/RegisterActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "RegisterActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/instantlabs/instant/RegisterActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/instantlabs/instant/RegisterActivity;->register(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private register(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 68
    new-instance v0, Lcom/google/gson/JsonObject;

    invoke-direct {v0}, Lcom/google/gson/JsonObject;-><init>()V

    const-string/jumbo v1, "username"

    .line 69
    invoke-virtual {v0, v1, p1}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "email"

    .line 70
    invoke-virtual {v0, p1, p2}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "password"

    .line 71
    invoke-virtual {v0, p1, p3}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "pin"

    .line 72
    invoke-virtual {v0, p1, p4}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    new-instance p1, Lokhttp3/OkHttpClient;

    invoke-direct {p1}, Lokhttp3/OkHttpClient;-><init>()V

    const-string p2, "application/json"

    .line 75
    invoke-static {p2}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object p2

    invoke-virtual {v0}, Lcom/google/gson/JsonObject;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object p2

    .line 76
    new-instance p3, Lokhttp3/Request$Builder;

    invoke-direct {p3}, Lokhttp3/Request$Builder;-><init>()V

    const-string p4, "http://mywalletv1.instant.htb/api/v1/register"

    .line 77
    invoke-virtual {p3, p4}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p3

    .line 78
    invoke-virtual {p3, p2}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object p2

    .line 79
    invoke-virtual {p2}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p2

    .line 80
    invoke-virtual {p1, p2}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object p1

    new-instance p2, Lcom/instantlabs/instant/RegisterActivity$3;

    invoke-direct {p2, p0}, Lcom/instantlabs/instant/RegisterActivity$3;-><init>(Lcom/instantlabs/instant/RegisterActivity;)V

    invoke-interface {p1, p2}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8

    .line 32
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 33
    sget p1, Lcom/instantlabs/instant/R$layout;->activity_register:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/RegisterActivity;->setContentView(I)V

    .line 35
    sget p1, Lcom/instantlabs/instant/R$id;->register_text:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/RegisterActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    .line 36
    sget v0, Lcom/instantlabs/instant/R$id;->username_input:I

    invoke-virtual {p0, v0}, Lcom/instantlabs/instant/RegisterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/widget/EditText;

    .line 37
    sget v0, Lcom/instantlabs/instant/R$id;->password_input:I

    invoke-virtual {p0, v0}, Lcom/instantlabs/instant/RegisterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/widget/EditText;

    .line 38
    sget v0, Lcom/instantlabs/instant/R$id;->email_input:I

    invoke-virtual {p0, v0}, Lcom/instantlabs/instant/RegisterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroid/widget/EditText;

    .line 39
    sget v0, Lcom/instantlabs/instant/R$id;->pin_input:I

    invoke-virtual {p0, v0}, Lcom/instantlabs/instant/RegisterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Landroid/widget/EditText;

    .line 40
    sget v0, Lcom/instantlabs/instant/R$id;->register_button:I

    invoke-virtual {p0, v0}, Lcom/instantlabs/instant/RegisterActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 42
    new-instance v7, Lcom/instantlabs/instant/RegisterActivity$1;

    move-object v1, v7

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/instantlabs/instant/RegisterActivity$1;-><init>(Lcom/instantlabs/instant/RegisterActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    new-instance v0, Lcom/instantlabs/instant/RegisterActivity$2;

    invoke-direct {v0, p0}, Lcom/instantlabs/instant/RegisterActivity$2;-><init>(Lcom/instantlabs/instant/RegisterActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
