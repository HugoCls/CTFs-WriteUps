.class public Lcom/instantlabs/instant/TransactionActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "TransactionActivity.java"


# static fields
.field private static final ACCESS_TOKEN_KEY:Ljava/lang/String; = "access_token"

.field private static final SHARED_PREFS_NAME:Ljava/lang/String; = "app_prefs"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/instantlabs/instant/TransactionActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 29
    invoke-direct/range {p0 .. p5}, Lcom/instantlabs/instant/TransactionActivity;->sendFunds(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private getAccessToken()Ljava/lang/String;
    .locals 3

    const-string v0, "app_prefs"

    const/4 v1, 0x0

    .line 151
    invoke-virtual {p0, v0, v1}, Lcom/instantlabs/instant/TransactionActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "access_token"

    const/4 v2, 0x0

    .line 152
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private sendFunds(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 67
    new-instance v0, Lcom/google/gson/JsonObject;

    invoke-direct {v0}, Lcom/google/gson/JsonObject;-><init>()V

    const-string v1, "receiver"

    .line 68
    invoke-virtual {v0, v1, p1}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "amount"

    .line 69
    invoke-virtual {v0, p1, p2}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "note"

    .line 70
    invoke-virtual {v0, p1, p3}, Lcom/google/gson/JsonObject;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    new-instance p1, Lokhttp3/OkHttpClient;

    invoke-direct {p1}, Lokhttp3/OkHttpClient;-><init>()V

    const-string p2, "application/json"

    .line 73
    invoke-static {p2}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object p2

    invoke-virtual {v0}, Lcom/google/gson/JsonObject;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object p2

    .line 74
    new-instance p3, Lokhttp3/Request$Builder;

    invoke-direct {p3}, Lokhttp3/Request$Builder;-><init>()V

    const-string v0, "http://mywalletv1.instant.htb/api/v1/initiate/transaction"

    .line 75
    invoke-virtual {p3, v0}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p3

    const-string v0, "Authorization"

    .line 76
    invoke-virtual {p3, v0, p4}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p3

    .line 77
    invoke-virtual {p3, p2}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object p2

    .line 78
    invoke-virtual {p2}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p2

    .line 79
    invoke-virtual {p1, p2}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object p1

    new-instance p2, Lcom/instantlabs/instant/TransactionActivity$2;

    invoke-direct {p2, p0, p5, p4}, Lcom/instantlabs/instant/TransactionActivity$2;-><init>(Lcom/instantlabs/instant/TransactionActivity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, p2}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8

    .line 36
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 37
    sget p1, Lcom/instantlabs/instant/R$layout;->activity_transaction:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/TransactionActivity;->setContentView(I)V

    .line 39
    sget p1, Lcom/instantlabs/instant/R$id;->recent_transaction:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/TransactionActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    .line 40
    sget p1, Lcom/instantlabs/instant/R$id;->wallet_id_input:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/TransactionActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Landroid/widget/EditText;

    .line 41
    sget p1, Lcom/instantlabs/instant/R$id;->amount_input:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/TransactionActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Landroid/widget/EditText;

    .line 42
    sget p1, Lcom/instantlabs/instant/R$id;->note_input:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/TransactionActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Landroid/widget/EditText;

    .line 43
    sget p1, Lcom/instantlabs/instant/R$id;->pin_input:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/TransactionActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v5, p1

    check-cast v5, Landroid/widget/EditText;

    .line 44
    sget p1, Lcom/instantlabs/instant/R$id;->send_btn:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/TransactionActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 46
    invoke-direct {p0}, Lcom/instantlabs/instant/TransactionActivity;->getAccessToken()Ljava/lang/String;

    move-result-object v6

    .line 47
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 49
    new-instance v7, Lcom/instantlabs/instant/TransactionActivity$1;

    move-object v0, v7

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/instantlabs/instant/TransactionActivity$1;-><init>(Lcom/instantlabs/instant/TransactionActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Ljava/lang/String;)V

    invoke-virtual {p1, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
