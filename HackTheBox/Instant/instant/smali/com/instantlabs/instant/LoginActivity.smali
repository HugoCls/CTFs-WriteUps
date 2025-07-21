.class public Lcom/instantlabs/instant/LoginActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "LoginActivity.java"


# static fields
.field private static final ACCESS_TOKEN_KEY:Ljava/lang/String; = "access_token"

.field private static final SHARED_PREFS_NAME:Ljava/lang/String; = "app_prefs"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/instantlabs/instant/LoginActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1, p2}, Lcom/instantlabs/instant/LoginActivity;->login(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/instantlabs/instant/LoginActivity;Ljava/lang/String;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Lcom/instantlabs/instant/LoginActivity;->storeAccessToken(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/instantlabs/instant/LoginActivity;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Lcom/instantlabs/instant/LoginActivity;->navigateToProfile()V

    return-void
.end method

.method private login(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 80
    new-instance v0, Lcom/google/gson/JsonObject;

    invoke-direct {v0}, Lcom/google/gson/JsonObject;-><init>()V

    const-string/jumbo v1, "username"

    .line 81
    invoke-virtual {v0, v1, p1}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "password"

    .line 82
    invoke-virtual {v0, p1, p2}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    new-instance p1, Lokhttp3/OkHttpClient;

    invoke-direct {p1}, Lokhttp3/OkHttpClient;-><init>()V

    const-string p2, "application/json"

    .line 85
    invoke-static {p2}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object p2

    invoke-virtual {v0}, Lcom/google/gson/JsonObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object p2

    .line 86
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    const-string v1, "http://mywalletv1.instant.htb/api/v1/login"

    .line 87
    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 88
    invoke-virtual {v0, p2}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object p2

    .line 89
    invoke-virtual {p2}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p2

    .line 90
    invoke-virtual {p1, p2}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object p1

    new-instance p2, Lcom/instantlabs/instant/LoginActivity$4;

    invoke-direct {p2, p0}, Lcom/instantlabs/instant/LoginActivity$4;-><init>(Lcom/instantlabs/instant/LoginActivity;)V

    invoke-interface {p1, p2}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V

    return-void
.end method

.method private navigateToProfile()V
    .locals 2

    .line 141
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/instantlabs/instant/ProfileActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 142
    invoke-virtual {p0, v0}, Lcom/instantlabs/instant/LoginActivity;->startActivity(Landroid/content/Intent;)V

    .line 143
    invoke-virtual {p0}, Lcom/instantlabs/instant/LoginActivity;->finish()V

    return-void
.end method

.method private storeAccessToken(Ljava/lang/String;)V
    .locals 2

    const-string v0, "app_prefs"

    const/4 v1, 0x0

    .line 134
    invoke-virtual {p0, v0, v1}, Lcom/instantlabs/instant/LoginActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 135
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "access_token"

    .line 136
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 137
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 38
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 39
    sget p1, Lcom/instantlabs/instant/R$layout;->activity_login:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/LoginActivity;->setContentView(I)V

    .line 41
    sget p1, Lcom/instantlabs/instant/R$id;->username_input:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    .line 42
    sget v0, Lcom/instantlabs/instant/R$id;->password_input:I

    invoke-virtual {p0, v0}, Lcom/instantlabs/instant/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 43
    sget v1, Lcom/instantlabs/instant/R$id;->forgot_password_text:I

    invoke-virtual {p0, v1}, Lcom/instantlabs/instant/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 44
    sget v2, Lcom/instantlabs/instant/R$id;->register_text:I

    invoke-virtual {p0, v2}, Lcom/instantlabs/instant/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 45
    sget v3, Lcom/instantlabs/instant/R$id;->login_button:I

    invoke-virtual {p0, v3}, Lcom/instantlabs/instant/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 47
    new-instance v4, Lcom/instantlabs/instant/LoginActivity$1;

    invoke-direct {v4, p0, p1, v0}, Lcom/instantlabs/instant/LoginActivity$1;-><init>(Lcom/instantlabs/instant/LoginActivity;Landroid/widget/EditText;Landroid/widget/EditText;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    new-instance p1, Lcom/instantlabs/instant/LoginActivity$2;

    invoke-direct {p1, p0}, Lcom/instantlabs/instant/LoginActivity$2;-><init>(Lcom/instantlabs/instant/LoginActivity;)V

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 69
    new-instance p1, Lcom/instantlabs/instant/LoginActivity$3;

    invoke-direct {p1, p0}, Lcom/instantlabs/instant/LoginActivity$3;-><init>(Lcom/instantlabs/instant/LoginActivity;)V

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
